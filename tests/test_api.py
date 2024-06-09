import pytest
from fastapi import status
from fastapi.testclient import TestClient

from src.api import app


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
