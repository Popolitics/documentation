"""
App Django minimale (mono-fichier) pour le benchmark backend.
Endpoints équivalents à fastapi_app.py, servis via ASGI pour une
comparaison équitable sur le même serveur (uvicorn).

Lancer :  uvicorn django_app:application --workers 1 --port 8002
"""
from django.conf import settings

if not settings.configured:
    settings.configure(
        DEBUG=False,
        ALLOWED_HOSTS=["*"],
        ROOT_URLCONF=__name__,
        SECRET_KEY="benchmark-only-not-secret",
        MIDDLEWARE=[],  # pas de middleware : on mesure l'overhead du framework
    )

import django  # noqa: E402

django.setup()

from django.core.asgi import get_asgi_application  # noqa: E402
from django.http import JsonResponse  # noqa: E402
from django.urls import path  # noqa: E402

_DEPUTES = [
    {"id": i, "nom": f"Depute {i}", "groupe": "GR", "votes": i % 7}
    for i in range(200)
]


def json_simple(request):
    return JsonResponse({"message": "Hello, World!"})


def deputes(request):
    return JsonResponse({"count": len(_DEPUTES), "results": _DEPUTES})


urlpatterns = [
    path("json", json_simple),
    path("deputes", deputes),
]

application = get_asgi_application()
