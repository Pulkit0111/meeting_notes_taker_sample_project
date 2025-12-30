# Meeting Note Taker - Boilerplate

AI-powered meeting transcription and analysis application. This boilerplate provides the project structure and scaffolding for students to build a full-stack application with FastAPI, LangChain, and React.

## 🎯 Project Overview

This project allows users to:
- Upload or record meeting audio files
- Automatically transcribe audio using OpenAI Whisper
- Extract structured notes (summary, key points, action items) using LangChain agents
- View and manage meeting history

## 🏗️ Project Structure

```
meeting-note-taker/
├── backend/                 # FastAPI backend
│   ├── main.py             # App entry point
│   ├── database.py         # Database models
│   ├── requirements.txt    # Python dependencies
│   ├── agents/             # LangChain agents
│   ├── routes/             # API endpoints
│   ├── utils/              # Utility functions
│   └── uploads/            # Audio file storage
│
├── frontend/               # React frontend
│   ├── public/
│   ├── src/
│   │   ├── components/     # React components
│   │   ├── pages/          # Page components
│   │   ├── services/       # API service layer
│   │   └── styles/         # CSS files
│   └── package.json
│
└── README.md
```

## 🚀 Getting Started

### Prerequisites

- **Python 3.9+**: [Download here](https://www.python.org/downloads/)
- **Node.js 16+**: [Download here](https://nodejs.org/)
- **OpenAI API Key**: [Get from OpenAI](https://platform.openai.com/api-keys)
- **Git**: For version control

### Backend Setup

```bash
# Navigate to backend directory
cd backend

# Create virtual environment
python -m venv venv

# Activate virtual environment
# On macOS/Linux:
source venv/bin/activate
# On Windows:
# venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Create .env file from example
cp .env.example .env

# Edit .env and add your OpenAI API key
# OPENAI_API_KEY=your-api-key-here

# Run the server
uvicorn main:app --reload --port 8000
```

Backend will be running at `http://localhost:8000`

### Frontend Setup

```bash
# Navigate to frontend directory (from project root)
cd frontend

# Install dependencies
npm install

# Create .env file from example
cp .env.example .env

# Start development server
npm start
```

Frontend will be running at `http://localhost:3000`

## 📋 Implementation Issues

This project is divided into 15 incremental issues. Complete them in order:

### Setup & Backend (Issues 1-6)
1. **[Issue #1: Project Setup and Environment Configuration](../../issues/1)**
   - Set up development environment
   - Install dependencies
   - Configure environment variables

2. **[Issue #2: Database Schema and Models](../../issues/2)**
   - Implement SQLAlchemy models
   - Create database tables
   - Test database connection

3. **[Issue #3: File Upload API Endpoint](../../issues/3)**
   - Implement file upload endpoint
   - Add file validation
   - Save files to uploads directory

4. **[Issue #4: Whisper API Integration for Transcription](../../issues/4)**
   - Integrate OpenAI Whisper API
   - Implement audio transcription
   - Handle API errors

5. **[Issue #5: LangChain Agent Chain Implementation](../../issues/5)**
   - Create summarization chain
   - Create key points extraction chain
   - Create action items extraction chain
   - Combine into sequential chain

6. **[Issue #6: Meeting CRUD API Endpoints](../../issues/6)**
   - Implement GET /api/meetings (list)
   - Implement GET /api/meetings/{id} (detail)
   - Implement DELETE /api/meetings/{id}
   - Implement GET /api/meetings/{id}/status

### Frontend (Issues 7-12)
7. **[Issue #7: React App Structure and Routing](../../issues/7)**
   - Set up React Router
   - Create page components
   - Implement navigation

8. **[Issue #8: File Upload Component](../../issues/8)**
   - Create upload button component
   - Handle file selection
   - Connect to backend API

9. **[Issue #9: Audio Recording Component](../../issues/9)**
   - Implement MediaRecorder API
   - Create recording modal
   - Handle audio blob creation

10. **[Issue #10: Meetings List Page](../../issues/10)**
    - Fetch meetings from API
    - Display meeting cards
    - Implement pagination

11. **[Issue #11: Meeting Detail Page](../../issues/11)**
    - Display full meeting details
    - Show summary, key points, action items
    - Implement collapsible transcript

12. **[Issue #12: Processing Status and Polling](../../issues/12)**
    - Create processing page
    - Implement status polling
    - Redirect when complete

### Polish (Issues 13-15)
13. **[Issue #13: Error Handling Implementation](../../issues/13)**
    - Add error handling to all API calls
    - Display user-friendly error messages
    - Handle edge cases

14. **[Issue #14: UI Styling and Responsiveness](../../issues/14)**
    - Apply CSS styling to all components
    - Make layout responsive
    - Add loading states and animations

15. **[Issue #15: Testing, Documentation, and Final Polish](../../issues/15)**
    - Test all features
    - Fix bugs
    - Update documentation
    - Prepare for demo

## 🛠️ Technology Stack

### Backend
- **FastAPI**: Modern Python web framework
- **SQLAlchemy**: SQL toolkit and ORM
- **LangChain**: Framework for LLM applications
- **OpenAI API**: Whisper (transcription) and GPT (analysis)
- **SQLite**: Lightweight database

### Frontend
- **React 18**: UI library
- **React Router**: Client-side routing
- **Axios**: HTTP client
- **Plain CSS**: Styling (no frameworks)

## 📚 Resources

### Documentation
- [FastAPI Docs](https://fastapi.tiangolo.com/)
- [LangChain Docs](https://python.langchain.com/)
- [OpenAI API Docs](https://platform.openai.com/docs/)
- [React Docs](https://react.dev/)
- [React Router Docs](https://reactrouter.com/)

### Tutorials
- [FastAPI Tutorial](https://fastapi.tiangolo.com/tutorial/)
- [LangChain Quickstart](https://python.langchain.com/docs/get_started/introduction)
- [React Tutorial](https://react.dev/learn)

## ✅ Success Criteria

Your implementation should include:

**Core Functionality**:
- ✅ Upload audio files
- ✅ Record audio in browser
- ✅ Automatic transcription
- ✅ AI-generated summary
- ✅ Extracted key points (3-5 items)
- ✅ Extracted action items
- ✅ Meeting history view
- ✅ Meeting detail view
- ✅ Delete meetings

**Technical Requirements**:
- ✅ FastAPI backend with all endpoints
- ✅ React frontend with routing
- ✅ LangChain agent chain
- ✅ Database persistence
- ✅ File upload and storage
- ✅ Error handling

**Code Quality**:
- ✅ Clean, organized code
- ✅ Comments and documentation
- ✅ No console errors
- ✅ README with setup instructions

## 🎨 Design Guidelines

Follow the design specifications in the PRD:
- **Color Scheme**: Indigo primary (#4F46E5), Green secondary (#10B981)
- **Typography**: System font stack, 16px base
- **Spacing**: 8px base unit (8px, 16px, 24px, 32px, 48px)
- **Components**: Clean, minimal design with clear feedback

## 🐛 Common Issues

### Backend Issues
- **Import errors**: Make sure virtual environment is activated
- **Database errors**: Check if database file has write permissions
- **API key errors**: Verify OPENAI_API_KEY in .env file
- **CORS errors**: Check CORS configuration in main.py

### Frontend Issues
- **Module not found**: Run `npm install` to install dependencies
- **API connection errors**: Ensure backend is running on port 8000
- **Blank page**: Check browser console for errors

## 📝 Notes

- This is a boilerplate template - **implement the logic yourself**
- Follow TODO comments in the code for guidance
- Complete issues in order for best results
- Test frequently as you build
- Ask for help when stuck!

## 🤝 Contributing

This is a learning project. Focus on:
1. Understanding the concepts
2. Writing clean, readable code
3. Testing your implementations
4. Documenting your work

## 📄 License

This project is for educational purposes.

---

**Good luck with your implementation!** 🚀

For detailed requirements, see the [Product Requirements Document](../docs/Meeting-Note-Taker-PRD.md).

