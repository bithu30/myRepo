# -*- coding: utf-8 -*-

import os
import base64
import pickle

from django.db import models
from django.db.models.fields.files import FieldFile
from django.core import cache
from django.core.exceptions import ObjectDoesNotExist
from django.core.files.uploadedfile import UploadedFile
from django.core.files.storage import default_storage
from django.contrib.contenttypes.models import ContentType
from django.conf import settings


__all__ = ("DbConfigValue", "ConfigFile", )


get_apps = models.get_apps


class Reference(object):
    
    def get_instance(self):
        raise NotImplementedError


class ModelReference(Reference):
    
    def __init__(self, instance):
        ctype = ContentType.objects.get_for_model(type(instance))
        self.ctype = ctype.pk
        self.pk = instance.pk
    
    def get_instance(self):
        try:
            ctype = ContentType.objects.get_for_id(self.ctype)
            return ctype.get_object_for_this_type(pk=self.pk)
        except ObjectDoesNotExist:
            return None


class FileReference(Reference):
    
    def __init__(self, field_file):
        self.name = field_file.name
    
    def get_instance(self):
        return ConfigFile(self.name)


class UploadedFileReference(FileReference):
    
    def __init__(self, uploaded_file):
        self.name = self.save_uploaded_file(uploaded_file)
    
    def save_uploaded_file(self, uploaded_file):
        name = "conf/%s" % uploaded_file.name
        path = os.path.join(os.path.abspath(settings.MEDIA_ROOT),
                            name)
        default_storage.save(path, uploaded_file)
        return name


class ConfigFile(object):
    
    def __init__(self, name):
        self.name = name
    
    @property
    def path(self):
        return os.path.join(os.path.abspath(settings.MEDIA_ROOT),
                            self.name)
    
    @property
    def url(self):
        return settings.MEDIA_URL + self.name
    
    def __unicode__(self):
        return self.name


class DbConfigValueManager(models.Manager):
    
    def __init__(self):
        super(DbConfigValueManager, self).__init__()
        try:
            self._cache = cache.get_cache("dbconfig")
        except ValueError:
            self._cache = cache.get_cache("locmem://")
    
    def get_value_for(self, name):
        if self._cache.has_key(name):
            value = self._cache.get(name)
            if isinstance(value, Reference):
                value = value.get_instance()
            return value
        try:
            db_value = self.get(name=name)
            value = db_value.get_value()
            self._cache.set(name, value)
            if isinstance(value, Reference):
                value = value.get_instance()
            return value
        except ObjectDoesNotExist:
            return None
    
    def set_value_for(self, name, value):
        if isinstance(value, models.Model):
            value = ModelReference(value)
        elif isinstance(value, UploadedFile):
            value = UploadedFileReference(value)
        elif isinstance(value, FieldFile) or \
                isinstance(value, ConfigFile):
            value = FileReference(value)
        self._cache.set(name, value)
        try:
            db_value = self.get(name=name)
        except ObjectDoesNotExist:
            db_value = DbConfigValue(name=name)
        db_value.value = value
        db_value.save()


class DbConfigValue(models.Model):
    
    name = models.CharField(max_length=255, primary_key=True)
    value64 = models.TextField()
    
    def get_value(self):
        pickled = base64.decodebytes(self.value64.encode('ascii'))
        value = pickle.loads(pickled)
        return value
    
    def set_value(self, value):
        pickled = pickle.dumps(value, protocol=2)
        self.value64 = base64.encodebytes(pickled)
        return value
    
    value = property(get_value, set_value)
    
    objects = DbConfigValueManager()
    
    def __unicode__(self):
        return self.name
    
    class Meta:
        verbose_name = "Config"
        verbose_name_plural = "Config"
