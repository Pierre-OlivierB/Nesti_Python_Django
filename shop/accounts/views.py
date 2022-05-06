from django.contrib.auth import get_user_model, login, logout
from django.shortcuts import render, redirect

User = get_user_model()


def signup(request):
    if request.method == "POST":
        username = request.POST.get("username") #name input
        password = request.POST.get("password")
        user = User.objects.create_user(username=username,
                                 password=password)
        login(request, user)
        return redirect('index')

    return render(request, 'accounts/signup.html')


def logout_user(request):
    logout(request)
    return redirect('index')

