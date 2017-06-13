# -*- coding: utf-8 -*-

from django.contrib import admin
from django.contrib.admin.options import csrf_protect_m
from django import template
from django.shortcuts import render_to_response, redirect
from django.dispatch import Signal

from .models import DbConfigValue
from .utils import registry


post_save = Signal(providing_args=[])


class ConfigAdmin(admin.ModelAdmin):

    def has_add_permission(self, request):
        return False

    def has_change_permission(self, request, instance=None):
        return instance is None

    has_delete_permission = has_change_permission

    @csrf_protect_m
    def changelist_view(self, request, extra_context=None):
        valid = True
        forms = []
        for group_cls in registry:
            form_class = group_cls._meta.form_class
            form_initial = group_cls._meta.form_initial
            if request.method == "POST":
                form = form_class(request.POST, request.FILES,
                                  initial=form_initial)
                if not form.is_valid():
                    valid = False
            else:
                form = form_class(initial=form_initial)
            title = getattr(group_cls, "verbose_name", None)
            if not isinstance(title, str):
                title = group_cls._meta.name
            forms.append({
                "cls":  group_cls,
                "name": title,
                "form": form,
            })
        if request.method == "POST" and valid:
            for form in forms:
                form["cls"]._meta.update(**form["form"].cleaned_data)
                post_save.send(sender=form["cls"])
            self.message_user(request, u"Config saved")

            return redirect(request.path)
        context = template.RequestContext(request, {"forms": forms})
        return render_to_response("admin/dbconfig_list.html", context)


if registry:
    admin.site.register(DbConfigValue, ConfigAdmin)
