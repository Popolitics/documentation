"""
App FastAPI minimale pour le benchmark backend.
Sert deux endpoints équivalents à ceux de l'app Django (django_app.py)
afin de comparer l'overhead pur du framework, à serveur égal (uvicorn).

Lancer :  uvicorn fastapi_app:app --workers 1 --port 8001
"""
from fastapi import FastAPI

app = FastAPI()

# Jeu de données simulant une réponse "data-service" (liste de députés).
_DEPUTES = [
    {"id": i, "nom": f"Depute {i}", "groupe": "GR", "votes": i % 7}
    for i in range(200)
]


@app.get("/json")
async def json_simple():
    """Endpoint de référence (sérialisation JSON minimale)."""
    return {"message": "Hello, World!"}


@app.get("/deputes")
async def deputes():
    """Charge utile représentative d'une réponse métier."""
    return {"count": len(_DEPUTES), "results": _DEPUTES}
