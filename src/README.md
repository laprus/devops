# FastAPI Application

A simple FastAPI application with health check and color generation endpoints.

## Features

- **Health Check**: `GET /healthy` - Returns 200 status for health monitoring
- **Color Generator**: `GET /generate` - Returns a random hex color code

## Development

This project uses Poetry for dependency management.

### Setup
```bash
poetry install
```

### Run the application
```bash
poetry run uvicorn app:app --reload
```

### Run tests
```bash
poetry run pytest tests/ -v
```

### Docker

Build the image:
```bash
docker build -t fastapi-app .
```

Run the container:
```bash
docker run -p 8000:8000 fastapi-app
```

## API Endpoints

### GET /healthy
Returns a health status response.

**Response:**
```json
{
  "status": "healthy"
}
```

### GET /generate
Generates and returns a random hex color.

**Response:**
```json
{
  "color": "#FF0000"
}
```