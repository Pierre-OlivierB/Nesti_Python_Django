from django.contrib import admin
from store.models import Product, Order, Cart
#from store.models import City, User, Cart


admin.site.register(Product)
admin.site.register(Order)
admin.site.register(Cart)


"""
admin.site.register(City)
admin.site.register(User)
"""


