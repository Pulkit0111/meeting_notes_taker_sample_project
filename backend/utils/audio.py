"""
Audio processing utilities
"""

import os
from openai import OpenAI
from dotenv import load_dotenv

load_dotenv()

# TODO: Initialize OpenAI client
# client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

def transcribe_audio(audio_file_path: str) -> str:
    """
    Transcribe audio file using OpenAI Whisper API
    
    Args:
        audio_file_path: Path to the audio file
    
    Returns:
        str: Transcribed text
    
    TODO: Implement this function
    - Open the audio file
    - Call OpenAI Whisper API
    - Return the transcription text
    - Handle errors (file not found, API errors)
    """
    # TODO: Implement audio transcription
    pass

def get_audio_duration(audio_file_path: str) -> int:
    """
    Get duration of audio file in seconds
    
    Args:
        audio_file_path: Path to the audio file
    
    Returns:
        int: Duration in seconds
    
    TODO: Implement this function (optional)
    - Use a library like pydub or mutagen
    - Return duration in seconds
    - Handle errors
    """
    # TODO: Implement duration calculation (optional)
    return 0

def validate_audio_file(file_content_type: str, file_size: int) -> tuple[bool, str]:
    """
    Validate audio file type and size
    
    Args:
        file_content_type: MIME type of the file
        file_size: Size of the file in bytes
    
    Returns:
        tuple: (is_valid, error_message)
    
    TODO: Implement this function
    - Check if file type is MP3, WAV, or M4A
    - Check if file size is under 25MB
    - Return (True, "") if valid
    - Return (False, error_message) if invalid
    """
    # TODO: Implement file validation
    MAX_FILE_SIZE = 25 * 1024 * 1024  # 25MB in bytes
    ALLOWED_TYPES = ["audio/mpeg", "audio/wav", "audio/mp4", "audio/x-m4a"]
    
    return True, ""

