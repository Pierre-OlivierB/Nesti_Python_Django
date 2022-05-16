from datetime import datetime

from django.db import models
from django.db import connections

# Create your models here.
from django.urls import reverse
from django.utils import timezone

from shop.settings import AUTH_USER_MODEL

"""
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
"""



#Article (Order)

"""


- Utilisateur
- Produit
- Quantité
- Commandé ou non
"""

"""
class Order(models.Model):
    user = models.ForeignKey(AUTH_USER_MODEL, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)
    ordered = models.BooleanField(default=False)
    ordered_date = models.DateTimeField(blank=True, null=True)

    def __str__(self):
        return f"{self.product.name} ({self.quantity})"
"""


# Panier (Cart)

"""
- Utilisateur
- Articles
- Commandé ou non
- Date de la commande
"""

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


#City

class City(models.Model):
    id_city = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=50)

    class Meta:
        managed = True
        db_table = 'nesti2_city'

#User


class User(models.Model):
    id_user = models.BigAutoField(primary_key=True)
    adress_1 = models.CharField(max_length=50)
    adress_2 = models.CharField(blank=True, null=True, max_length=50)
    creation_date = models.DateTimeField(blank=True, null=True)
    email = models.CharField(max_length=200)
    password = models.CharField(max_length=255)
    firstname = models.CharField(max_length=50)
    lastname = models.CharField(max_length=50)
    status = models.CharField(max_length=1)
    id_city = models.ForeignKey(City, db_column='id_city', on_delete=models.CASCADE)
    zipcode = models.IntegerField

    class Meta:
        managed = True
        db_table = 'nesti2_user'

#Product


class Product(models.Model):
    id_product = models.BigAutoField(primary_key=True)
    product_name = models.CharField(default='test', max_length=128)

    class Meta:
        managed = True
        db_table = 'nesti2_product'


class Category(models.Model):
    id_category = models.BigAutoField(primary_key=True)
    tag = models.CharField(max_length=120)

    class Meta:
        managed = True
        db_table = 'nesti2_category'


class Image(models.Model):
    id_image = models.BigAutoField(primary_key=True)
    creation_date = models.DateTimeField(blank=True, null=True)
    i_name = models.CharField(max_length=250)
    extension = models.CharField(max_length=6)

    class Meta:
        managed = True
        db_table = 'nesti2_image'


class Recipe(models.Model):
    id_recipe = models.BigAutoField(primary_key=True)
    creation_date = models.DateTimeField(blank=True, null=True)
    difficulty = models.SmallIntegerField()
    id_category = models.ForeignKey(Category, db_column='id_category', on_delete=models.CASCADE)
    id_user = models.ForeignKey(User, db_column='id_user', on_delete=models.CASCADE)
    number_people = models.IntegerField()
    recipe_name = models.CharField(max_length=120)
    recipe_time = models.TimeField(blank=True, null=True)
    id_image = models.ForeignKey(Image, db_column='id_image', on_delete=models.CASCADE, related_name="image_sets")
    #id_image = models.ManyToManyField(Image)

    class Meta:
        managed = False
        db_table = 'nesti2_recipe'


"""
#Measurement
class Measurement(models.Model):
   name = models.CharField(max_length = 50)

    class Meta:
        managed = True
        db_table = 'nesti2_measurement'

#Ingredient
class Ingredients(models.Model):
   id_product = models.ForeignKey(Product, on_delete=models.CASCADE)

    class Meta:
        managed = True
        db_table = 'nesti2_ingredients'


class Article(models.Model):
   unity_by_quantity = models.SmallIntegerField(max_length=6)
   status = models.CharField(max_length=6, null=False)
   creation_date =  models.DateTimeField(blank=True, null=True)
   date_update = models.DateTimeField(blank=True, null=True)
   id_image = models.ForeignKey(Image, on_delete=models.CASCADE)
   id_product = models.ForeignKey(Product, on_delete=models.CASCADE)
   id_unit = models.ForeignKey(Measurement, on_delete=models.CASCADE)

   class Meta:
        managed = True
        db_table = 'nesti2_article'


class ArticlePrice(models.Model):
   application_date = models.DateTimeField(blank=True, null=True)
   price = models.DecimalField(max_digits=15, decimal_places=2)
   id_article = models.ForeignKey(Article, on_delete=models.CASCADE)

    class Meta:
        managed = True
        db_table = 'nesti2_article_price'

class Lot(models.Model):
   id_article = models.ForeignKey(Article, on_delete=models.CASCADE)
   unit_cost = models.DecimalField(max_digits=15, decimal_places=2)
   quantity_purchased = models.SmallIntegerField(max_length=6)
   reception_date = models.DateTimeField(blank=True, null=True)

   class Meta:
        managed = True
        db_table = 'nesti2_lot'



class Command(models.Model):
   status = models.CharField(max_length=1)
   creation_date = models.DateTimeField(blank=True, null=True)
   id_user = models.ForeignKey(User, on_delete=models.CASCADE)
   
   class Meta:
        managed = True
        db_table = 'nesti2_command'


class UserLog(models.Model):
   date_de_connexion = models.DateTimeField(blank=True, null=True)
   id_user = models.ForeignKey(User, on_delete=models.CASCADE)

    class Meta:
        managed = True
        db_table = 'nesti2_user_log'


class Chief(models.Model):
   id_user = models.ForeignKey(User, on_delete=models.CASCADE)
   
   class Meta:
        managed = True
        db_table = 'nesti2_chief'


class Moderator(models.Model):
   id_user = models.ForeignKey(User, on_delete=models.CASCADE)
   
   class Meta:
        managed = True
        db_table = 'nesti2_moderator'


class Admin(models.Model):
   id_user = models.ForeignKey(User, on_delete=models.CASCADE)
   
   class Meta:
        managed = True
        db_table = 'nesti2_admin'


class Commentary(models.Model):
   id_user_1 = models.ForeignKey(User, on_delete=models.CASCADE)
   id_recipe = models.ForeignKey(Recipe, on_delete=models.CASCADE)
   title_of_comentary = models.CharField(max_length=50, null=False)
   comment_content = models.CharField(max_length=50, null=False)
   creation_date = models.DateTimeField(blank=True, null=True)
   status = models.CharField(max_length=1, null=False)
   id_user = models.ForeignKey(User, on_delete=models.CASCADE)
   
   class Meta:
        managed = True
        db_table = 'nesti2_commentary'


class Paragraph(models.Model):
   p_order = models.SmallIntegerField(max_length=6)
   creation_date = models.DateTimeField(blank=True, null=True)
   content = models.CharField(max_length=50, null=False)
   id_recipe = models.ForeignKey(Recipe, on_delete=models.CASCADE)
   
   class Meta:
        managed = True
        db_table = 'nesti2_paragraph'


class RecipeIngredient(models.Model):
   id_recipe = models.ForeignKey(Recipe, on_delete=models.CASCADE)
   id_product = models.ForeignKey(Product, on_delete=models.CASCADE)
   quantity = models.SmallIntegerField(max_length=6, null=False)
   r_order = models.SmallIntegerField(max_length=6, null=False)
   id_unit = models.ForeignKey(User, on_delete=models.CASCADE)
   
   class Meta:
        managed = True
        db_table = 'nesti2_recipe_ingredient'


class Importation(models.Model):
   id_article = models.ForeignKey(Product, on_delete=models.CASCADE)
   ref_commande = models.ForeignKey(Command, on_delete=models.CASCADE)
   id_user = models.ForeignKey(User, on_delete=models.CASCADE)
   import_date = models.DateTimeField(blank=True, null=True)
   
   class Meta:
        managed = True
        db_table = 'nesti2_importation'


class OrderLine(models.Model):
   id_article = models.ForeignKey(Article, on_delete=models.CASCADE)
   id_command = models.ForeignKey(Command, on_delete=models.CASCADE)
   amount_ordered = models.SmallIntegerField(max_length=6, null=False)
   
   class Meta:
        managed = True
        db_table = 'order_line'


class GivesGrade(models.Model):
   id_recipe = models.ForeignKey(Recipe, on_delete=models.CASCADE)
   id_user = models.ForeignKey(User, on_delete=models.CASCADE)
   five_grades = models.SmallIntegerField(max_length=6)

   class Meta:
        managed = True
        db_table = 'gives_a_grade'
"""


    



