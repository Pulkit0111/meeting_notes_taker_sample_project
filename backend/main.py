"""
Meeting Note Taker - FastAPI Backend
Main application entry point
"""

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
# TODO: Import your routes here
# from routes import meetings

app = FastAPI(
    title="Meeting Note Taker API",
    description="API for transcribing and analyzing meeting audio",
    version="1.0.0"
)

# TODO: Configure CORS - Update origins for your frontend URL
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],  # Update this for production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# TODO: Include your routers here
# app.include_router(meetings.router, prefix="/api/meetings", tags=["meetings"])

@app.get("/")
async def root():
    """Health check endpoint"""
    return {"message": "Meeting Note Taker API is running", "status": "ok"}

@app.get("/health")
async def health_check():
    """Health check endpoint for monitoring"""
    return {"status": "healthy"}

# TODO: Add startup and shutdown events if needed
# @app.on_event("startup")
# async def startup_event():
#     """Initialize database and other resources"""
#     pass

# @app.on_event("shutdown")
# async def shutdown_event():
#     """Cleanup resources"""
#     pass

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)

