# Issue #1: Project Setup and Environment Configuration

**Priority**: High  
**Estimated Time**: 4-6 hours  
**Dependencies**: None  
**Labels**: `setup`, `backend`, `frontend`

## Description
Set up the development environment for both backend and frontend. This is the foundation for all subsequent work.

## Tasks
- [ ] Install Python 3.9+ and verify installation
- [ ] Install Node.js 16+ and verify installation
- [ ] Create Python virtual environment in `backend/` directory
- [ ] Install backend dependencies from `requirements.txt`
- [ ] Install frontend dependencies with `npm install`
- [ ] Get OpenAI API key from platform.openai.com
- [ ] Create `.env` file in backend from `.env.example`
- [ ] Add OPENAI_API_KEY to `.env` file
- [ ] Create `.env` file in frontend from `.env.example`
- [ ] Test backend server runs: `uvicorn main:app --reload --port 8000`
- [ ] Test frontend runs: `npm start`
- [ ] Verify backend accessible at http://localhost:8000
- [ ] Verify frontend accessible at http://localhost:3000
- [ ] Check FastAPI docs at http://localhost:8000/docs

## Acceptance Criteria
- ✅ Both backend and frontend run without errors
- ✅ Can access FastAPI Swagger docs
- ✅ Can see React placeholder page
- ✅ Environment variables are properly configured
- ✅ No import or dependency errors

## Files to Modify
- `backend/.env` (create from .env.example)
- `frontend/.env` (create from .env.example)

## Hints
- Make sure to activate the virtual environment before installing Python packages
- On Windows, use `venv\Scripts\activate` instead of `source venv/bin/activate`
- If you get SSL errors with pip, try: `pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org`
- Keep both servers running in separate terminal windows

## Resources
- [Python Virtual Environments](https://docs.python.org/3/tutorial/venv.html)
- [FastAPI First Steps](https://fastapi.tiangolo.com/tutorial/first-steps/)
- [Create React App](https://create-react-app.dev/docs/getting-started/)

## Testing
Run these commands to verify setup:
```bash
# Backend
cd backend
source venv/bin/activate
python -c "import fastapi; print('FastAPI installed')"
uvicorn main:app --reload --port 8000

# Frontend (in new terminal)
cd frontend
npm start
```

---
**Next Issue**: #2 Database Schema and Models

