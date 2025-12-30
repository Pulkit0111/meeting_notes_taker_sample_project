"""
Database configuration and models
"""

from sqlalchemy import create_engine, Column, Integer, String, Text, DateTime
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from datetime import datetime
import os
from dotenv import load_dotenv

load_dotenv()

# TODO: Get database URL from environment variable
DATABASE_URL = os.getenv("DATABASE_URL", "sqlite:///./meetings.db")

# TODO: Create engine
# engine = create_engine(DATABASE_URL, connect_args={"check_same_thread": False})

# TODO: Create SessionLocal class
# SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

# TODO: Define Meeting model
class Meeting(Base):
    """
    Meeting model for storing meeting data
    
    Attributes:
        id: Primary key
        title: Meeting title
        audio_filename: Path to stored audio file
        transcript: Full transcription text
        summary: AI-generated summary
        key_points: JSON string of key discussion points
        action_items: JSON string of action items
        duration: Meeting duration in seconds
        created_at: Timestamp of creation
    """
    __tablename__ = "meetings"
    
    # TODO: Define columns based on the schema in the PRD
    # id = Column(Integer, primary_key=True, index=True)
    # title = Column(String, nullable=False)
    # audio_filename = Column(String, nullable=False)
    # transcript = Column(Text, nullable=False)
    # summary = Column(Text, nullable=False)
    # key_points = Column(Text, nullable=False)  # JSON string
    # action_items = Column(Text, nullable=False)  # JSON string
    # duration = Column(Integer, nullable=True)
    # created_at = Column(DateTime, default=datetime.utcnow)

# TODO: Create tables
# def init_db():
#     """Initialize database tables"""
#     Base.metadata.create_all(bind=engine)

# TODO: Dependency to get database session
# def get_db():
#     """Get database session"""
#     db = SessionLocal()
#     try:
#         yield db
#     finally:
#         db.close()

