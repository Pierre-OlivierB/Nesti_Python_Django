from django.shortcuts import render

from store.models import Product


def Showrecipe(request):
    resultsdisplay = Product.objects.all()
    return render(request, "Page1.html", {'Product': resultsdisplay})