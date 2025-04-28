from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils import timezone


class User(AbstractUser):
    email = models.EmailField(unique=True)
    registration_date = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.username