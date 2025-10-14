import pytest
from fastapi.testclient import TestClient
from app import app

client = TestClient(app)


def test_healthy_endpoint():
    """Test the /healthy endpoint"""
    response = client.get("/healthy")
    assert response.status_code == 200
    assert response.json() == {"status": "healthy v0.1.5"}


def test_generate_endpoint():
    """Test the /generate endpoint"""
    response = client.get("/generate")
    assert response.status_code == 200
    
    data = response.json()
    assert "color" in data
    
    # Check if it's a valid hex color
    color = data["color"]
    assert color.startswith("#")
    assert len(color) == 7
    
    # Check if it's valid hex
    try:
        int(color[1:], 16)
    except ValueError:
        pytest.fail(f"Generated color {color} is not a valid hex color")


def test_generate_endpoint_different_colors():
    """Test that /generate endpoint returns different colors (probabilistically)"""
    colors = set()
    for _ in range(10):
        response = client.get("/generate")
        assert response.status_code == 200
        color = response.json()["color"]
        colors.add(color)
    
    # It's extremely unlikely that all 10 colors are the same
    assert len(colors) > 1, "Generated colors should be different"