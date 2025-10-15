import random
from fastapi import FastAPI

app = FastAPI(title="DevOps Sample API", version="0.1.0")


@app.get("/healthy")
def healthy():
    """Health check endpoint"""
    return {"status": "healthy"}

@app.get("/version")
def version():
    """Version endpoint"""
    return {"version": "v5"}

@app.get("/generate")
def generate_color():
    """Generate a random hex color"""
    # Generate random RGB values
    r = random.randint(0, 255)
    g = random.randint(0, 255)
    b = random.randint(0, 255)
    
    # Convert to hex format
    hex_color = f"#{r:02X}{g:02X}{b:02X}"
    
    return {"color": hex_color}


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)