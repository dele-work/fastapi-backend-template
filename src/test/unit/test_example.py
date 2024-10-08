from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)


def test_root_endpoint():
    expected_response = {"message": "Hello World"}

    response = client.get("/")

    assert response.status_code == 200
    assert response.json() == expected_response
