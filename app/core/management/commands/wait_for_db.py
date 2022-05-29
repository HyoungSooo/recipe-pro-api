"""
Django command to wait for database to be ready.
"""

from django.core.management.base import BaseCommand


class Command(BaseCommand):
    help = 'Wait for database to be ready'

    def handle(self, *args, **options):
        pass
