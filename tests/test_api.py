from fastapi.testclient import TestClient
from fastapi import status
import pytest 

from src.api import app


@pytest.fixture
def client():
    with TestClient(app) as api:
        yield api

def test_api_root(client):
    
    response = client.get("/")
    assert response.status_code == status.HTTP_200_OK
    assert response.json() == "hello world"