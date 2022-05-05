from datetime import datetime

from django.db import models
from django.db import connections

# Create your models here.


class Product(models.Model):
    name = models.CharField(default='test', max_length=128)
    price = models.FloatField(default=0.0)
    stock = models.IntegerField(default=0)
    description = models.TextField(blank=True)
    thumbnail = models.ImageField(upload_to="products", blank=True, null=True)


