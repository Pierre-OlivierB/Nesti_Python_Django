from datetime import datetime

from django.db import models
from django.db import connections

# Create your models here.
from django.urls import reverse
from django.utils import timezone

from shop.settings import AUTH_USER_MODEL


class Product(models.Model):
    name = models.CharField(default='test', max_length=128)
    slug = models.SlugField(max_length=128)
    price = models.FloatField(default=0.0)
    stock = models.IntegerField(default=0)
    description = models.TextField(blank=True)
    thumbnail = models.ImageField(upload_to="products", blank=True, null=True)

    def __str__(self):
        return f"{self.name}({self.stock})"

    def get_absolute_url(self):
        return reverse("product", kwargs={"slug": self.slug})


#Article (Order)

"""


- Utilisateur
- Produit
- Quantité
- Commandé ou non
"""


class Order(models.Model):
    user = models.ForeignKey(AUTH_USER_MODEL, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)
    ordered = models.BooleanField(default=False)
    ordered_date = models.DateTimeField(blank=True, null=True)

    def __str__(self):
        return f"{self.product.name} ({self.quantity})"

# Panier (Cart)

"""
- Utilisateur
- Articles
- Commandé ou non
- Date de la commande
"""


class Cart(models.Model):
    user = models.OneToOneField(AUTH_USER_MODEL, on_delete=models.CASCADE)#l'utlisateur ne peut avoir qu'un seul panier
    orders = models.ManyToManyField(Order)

    def __str__(self):
        return self.user.username

    def delete(self, *args, **kwargs):
        for order in self.orders.all():
            order.ordered = True
            order.ordered_date = timezone.now()
            order.save()

        self.orders.clear()
        super().delete(*args, **kwargs)


"""
class City(models.Model):
    name = models.CharField(max_length=50)


class User(models.Model):
    adress_1 = models.CharField(max_length=50)
    adress_2 = models.CharField(blank=True, null=True, max_length=50)
    creations_date = models.DateTimeField(blank=True, null=True)
    email = models.CharField(max_length=200)
    password = models.CharField(max_length=255)
    firstname = models.CharField(max_length=50)
    lastname = models.CharField(max_length=50)
    status = models.CharField(max_length=1)
    id_city = models.ForeignKey(City, on_delete=models.CASCADE)
    zipcode = models.IntegerField(max_length=11)


class Product(models.Model):
    product_name = models.CharField(default='test', max_length=128)


class Category(models.Model):
    libelle = models.CharField(max_length=120)


class Recipe(models.Model):
    creation_date = models.DateTimeField(blank=True, null=True)
    difficulty = models.SmallIntegerField(max_length=6)
    id_category = models.ForeignKey(Category, on_delete=models.CASCADE)
    id_user = models.ForeignKey(User, on_delete=models.CASCADE)
    number_people = models.IntegerField(max_length=11)
    recipe_name = models.CharField(max_length=120)
    recipe_time = models.TimeField(blank=True, null=True)

"""


