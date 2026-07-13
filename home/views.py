from django.shortcuts import render
from django.contrib.auth.models import User
from django.core.cache import cache

def get_users():
    users = cache.get("users")

    if users is None:
        users = list(User.objects.all())
        cache.set("users", users, 60) # cache for 60 seconds

    return users


def home(request):
    context = {
        'title': "Welcome to the Django Docker CI/CD Project!",
        'users': get_users(),
    }
    return render(request, 'home.html', context)


