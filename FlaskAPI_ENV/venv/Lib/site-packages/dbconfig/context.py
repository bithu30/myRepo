# -*- coding: utf-8 -*-

from .utils import registry


__all__ = ("config_context", )


def config_context(request):
    return dict([(group._meta.name, group)
                 for group in registry])
