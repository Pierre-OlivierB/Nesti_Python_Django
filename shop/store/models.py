from django.db import models
from django.db import connections

# Create your models here.
class Product(models.Model):
    name = models.Charfield(max_length=128)
