from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404, redirect
from django.urls import reverse

#from store.models import Product, Cart, Order

from store.models import Recipe
#from store.models import City, User, Product, Category, Recipe, Image, #Measurement, Ingredients, Article, ArticlePrice, Lot, Command, UserLog, Chief, Moderator, Admin, Commentary, Paragraph, RecipeIngredient, Importation, OrderLine, GivesGrade

"""
def index(request):
    products = Product.objects.all()
    return render(request, 'store/index.html', context={"products": products})


def product_detail(request, slug):
    product = get_object_or_404(Product, slug=slug)
    return render(request, 'store/detail.html', context={"product": product})


#video 2h00/2h05 attention on est dans le vue il faut faire le if dans model
def add_to_cart(request, slug):
    user = request.user
    product = get_object_or_404(Product, slug=slug)
    cart, _ = Cart.objects.get_or_create(user=user)
    order, created = Order.objects.get_or_create(user=user, ordered=False, product=product)

    if created:
        cart.orders.add(order)
        cart.save()
    else:
        order.quantity += 1
        order.save()

    return redirect(reverse("product", kwargs={"slug": slug}))


def cart(request):
    cart = get_object_or_404(Cart, user=request.user)
    return render(request, 'store/cart.html', context={'orders': cart.orders.all()})


def delete_cart(request):
    if cart := request.user.cart: #concatenation assignation et condition
        cart.delete()
    return redirect('index')
"""
#section test:


def index(request):
    recipes = Recipe.objects.all()
    return render(request, 'store/index.html', context={"recipes": recipes})


def recipe_detail(request, recipe_name):
    recipe = get_object_or_404(Recipe, recipe_name=recipe_name)
    return render(request, 'store/detail.html', context={"recipe": recipe})


