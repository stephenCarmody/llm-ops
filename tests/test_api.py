import pytest
from fastapi import status
from fastapi.testclient import TestClient

from serving.api import app


@pytest.fixture
def client():
    with TestClient(app) as api:
        yield api


def test_root(client):

    response = client.get("/")
    assert response.status_code == status.HTTP_200_OK
    assert response.json() == "hello world"


def test_ping(client):

    response = client.get("/ping")
    assert response.status_code == status.HTTP_200_OK
    assert response.json() == "pong"


def test_inference(client):

    response = client.post("/inference")
    assert response.status_code == status.HTTP_200_OK
    assert response.json() == {"predictions": [0.1, 0.2, 0.3]}
