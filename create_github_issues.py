#!/usr/bin/env python3
"""
Script to create GitHub issues for Meeting Note Taker project using GitHub API
Usage: python3 create_github_issues.py <github_token>
"""

import sys
import requests
import json

REPO_OWNER = "Pulkit0111"
REPO_NAME = "meeting_notes_taker_sample_project"

ISSUES = [
    {
        "title": "Project Setup and Environment Configuration",
        "body": """## Issue #1: Project Setup and Environment Configuration

**Priority**: High  
**Estimated Time**: 4-6 hours  
**Dependencies**: None

### Description
Set up the development environment for both backend and frontend. This is the foundation for all subsequent work.

### Tasks
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

### Acceptance Criteria
- ✅ Both backend and frontend run without errors
- ✅ Can access FastAPI Swagger docs
- ✅ Can see React placeholder page
- ✅ Environment variables are properly configured
- ✅ No import or dependency errors

### Files to Modify
- `backend/.env` (create from .env.example)
- `frontend/.env` (create from .env.example)

### Hints
- Make sure to activate the virtual environment before installing Python packages
- On Windows, use `venv\\Scripts\\activate` instead of `source venv/bin/activate`
- Keep both servers running in separate terminal windows

### Resources
- [Python Virtual Environments](https://docs.python.org/3/tutorial/venv.html)
- [FastAPI First Steps](https://fastapi.tiangolo.com/tutorial/first-steps/)

---
**Next Issue**: #2 Database Schema and Models""",
        "labels": ["setup", "backend", "frontend"]
    },
    {
        "title": "Database Schema and Models",
        "body": """## Issue #2: Database Schema and Models

**Priority**: High  
**Estimated Time**: 3-4 hours  
**Dependencies**: Issue #1

### Description
Implement the SQLAlchemy database models and create the meetings table schema.

### Tasks
- [ ] Uncomment and implement the `Meeting` model in `database.py`
- [ ] Define all columns according to PRD schema
- [ ] Uncomment and implement `create_engine`
- [ ] Uncomment and implement `SessionLocal`
- [ ] Implement `init_db()` function
- [ ] Implement `get_db()` dependency
- [ ] Test database creation
- [ ] Verify table structure

### Acceptance Criteria
- ✅ Database file is created when server starts
- ✅ `meetings` table exists with correct schema
- ✅ Can insert test records
- ✅ `get_db()` dependency works correctly

### Files to Modify
- `backend/database.py`

### Resources
- [SQLAlchemy ORM Tutorial](https://docs.sqlalchemy.org/en/20/tutorial/orm_data_manipulation.html)
- [FastAPI SQL Databases](https://fastapi.tiangolo.com/tutorial/sql-databases/)

---
**Previous Issue**: #1 Project Setup  
**Next Issue**: #3 File Upload API Endpoint""",
        "labels": ["backend", "database"]
    },
    {
        "title": "File Upload API Endpoint",
        "body": """## Issue #3: File Upload API Endpoint

**Priority**: High  
**Estimated Time**: 4-5 hours  
**Dependencies**: Issue #2

### Description
Implement the file upload endpoint that accepts audio files, validates them, and saves them to the uploads directory.

### Tasks
- [ ] Implement `save_audio_file()` in `utils/storage.py`
- [ ] Implement `validate_audio_file()` in `utils/audio.py`
- [ ] Implement `upload_meeting()` endpoint in `routes/meetings.py`
- [ ] Add file size validation (max 25MB)
- [ ] Add file type validation (MP3, WAV, M4A)
- [ ] Generate unique filename with timestamp
- [ ] Create meeting record in database
- [ ] Include router in `main.py`
- [ ] Test with Postman or curl

### Acceptance Criteria
- ✅ Can upload audio files via POST /api/meetings/upload
- ✅ Files are saved to uploads/ directory
- ✅ Invalid file types are rejected
- ✅ Files over 25MB are rejected
- ✅ Meeting record is created in database

### Files to Modify
- `backend/routes/meetings.py`
- `backend/utils/storage.py`
- `backend/utils/audio.py`
- `backend/main.py`

### Resources
- [FastAPI File Uploads](https://fastapi.tiangolo.com/tutorial/request-files/)

---
**Previous Issue**: #2 Database Schema  
**Next Issue**: #4 Whisper API Integration""",
        "labels": ["backend", "api"]
    },
    {
        "title": "Whisper API Integration for Transcription",
        "body": """## Issue #4: Whisper API Integration for Transcription

**Priority**: High  
**Estimated Time**: 3-4 hours  
**Dependencies**: Issue #3

### Description
Integrate OpenAI Whisper API to transcribe audio files to text.

### Tasks
- [ ] Implement `transcribe_audio()` in `utils/audio.py`
- [ ] Initialize OpenAI client with API key
- [ ] Call Whisper API with audio file
- [ ] Handle API errors
- [ ] Update `upload_meeting()` to call transcription
- [ ] Store transcript in database
- [ ] Test with sample audio files

### Acceptance Criteria
- ✅ Audio files are successfully transcribed
- ✅ Transcript is stored in database
- ✅ API errors are handled gracefully
- ✅ Works with MP3, WAV, and M4A files

### Files to Modify
- `backend/utils/audio.py`
- `backend/routes/meetings.py`

### Resources
- [OpenAI Whisper API Docs](https://platform.openai.com/docs/guides/speech-to-text)

---
**Previous Issue**: #3 File Upload  
**Next Issue**: #5 LangChain Agents""",
        "labels": ["backend", "ai"]
    },
    {
        "title": "LangChain Agent Chain Implementation",
        "body": """## Issue #5: LangChain Agent Chain Implementation

**Priority**: High  
**Estimated Time**: 5-6 hours  
**Dependencies**: Issue #4

### Description
Implement LangChain agents to analyze meeting transcripts and extract structured information.

### Tasks
- [ ] Initialize OpenAI LLM in `agents/meeting_agent.py`
- [ ] Implement `create_summary_chain()`
- [ ] Implement `create_key_points_chain()`
- [ ] Implement `create_action_items_chain()`
- [ ] Implement `create_meeting_analysis_chain()`
- [ ] Implement `parse_chain_output()`
- [ ] Implement `analyze_meeting()` main function
- [ ] Test with sample transcripts
- [ ] Update upload endpoint to call analysis

### Acceptance Criteria
- ✅ Summary is generated (3-5 sentences)
- ✅ Key points are extracted (3-5 items)
- ✅ Action items are extracted
- ✅ Output is properly formatted JSON
- ✅ All data is stored in database

### Files to Modify
- `backend/agents/meeting_agent.py`
- `backend/routes/meetings.py`

### Resources
- [LangChain Chains](https://python.langchain.com/docs/modules/chains/)

---
**Previous Issue**: #4 Whisper Integration  
**Next Issue**: #6 Meeting CRUD APIs""",
        "labels": ["backend", "ai"]
    },
    {
        "title": "Meeting CRUD API Endpoints",
        "body": """## Issue #6: Meeting CRUD API Endpoints

**Priority**: High  
**Estimated Time**: 4-5 hours  
**Dependencies**: Issue #5

### Description
Implement the remaining API endpoints for retrieving, listing, and deleting meetings.

### Tasks
- [ ] Implement `get_meeting(meeting_id)` endpoint
- [ ] Implement `list_meetings(page, limit)` endpoint
- [ ] Implement `get_meeting_status(meeting_id)` endpoint
- [ ] Implement `delete_meeting(meeting_id)` endpoint
- [ ] Implement `delete_audio_file()` in `utils/storage.py`
- [ ] Add pagination logic
- [ ] Parse JSON fields before returning
- [ ] Handle 404 errors
- [ ] Test all endpoints

### Acceptance Criteria
- ✅ GET /api/meetings returns paginated list
- ✅ GET /api/meetings/{id} returns full meeting data
- ✅ GET /api/meetings/{id}/status returns status
- ✅ DELETE /api/meetings/{id} removes meeting and file
- ✅ Pagination works correctly

### Files to Modify
- `backend/routes/meetings.py`
- `backend/utils/storage.py`

### Resources
- [FastAPI Path Parameters](https://fastapi.tiangolo.com/tutorial/path-params/)

---
**Previous Issue**: #5 LangChain Agents  
**Next Issue**: #7 React App Structure""",
        "labels": ["backend", "api"]
    },
    {
        "title": "React App Structure and Routing",
        "body": """## Issue #7: React App Structure and Routing

**Priority**: High  
**Estimated Time**: 3-4 hours  
**Dependencies**: Issue #6

### Description
Set up React Router and create the basic page structure for the application.

### Tasks
- [ ] Uncomment imports in `App.js`
- [ ] Define routes for all pages
- [ ] Create basic page layouts
- [ ] Add navigation between pages
- [ ] Test routing works without page refresh

### Acceptance Criteria
- ✅ All routes are defined and working
- ✅ Can navigate between pages
- ✅ URL changes without page refresh
- ✅ Each page displays placeholder content

### Files to Modify
- `frontend/src/App.js`
- `frontend/src/pages/*.js`

### Resources
- [React Router Tutorial](https://reactrouter.com/en/main/start/tutorial)

---
**Previous Issue**: #6 Meeting CRUD APIs  
**Next Issue**: #8 File Upload Component""",
        "labels": ["frontend"]
    },
    {
        "title": "File Upload Component",
        "body": """## Issue #8: File Upload Component

**Priority**: High  
**Estimated Time**: 4-5 hours  
**Dependencies**: Issue #7

### Description
Implement the file upload component and connect it to the backend API.

### Tasks
- [ ] Implement `UploadButton` component
- [ ] Handle file selection
- [ ] Validate file type and size
- [ ] Implement `uploadMeeting()` in `services/api.js`
- [ ] Show loading state during upload
- [ ] Navigate to processing page after upload
- [ ] Display error messages
- [ ] Integrate into HomePage

### Acceptance Criteria
- ✅ Can select audio files
- ✅ Invalid files show error message
- ✅ Files are uploaded to backend
- ✅ Redirects to processing page

### Files to Modify
- `frontend/src/components/UploadButton.js`
- `frontend/src/services/api.js`
- `frontend/src/pages/HomePage.js`

### Resources
- [MDN File API](https://developer.mozilla.org/en-US/docs/Web/API/File)

---
**Previous Issue**: #7 React App Structure  
**Next Issue**: #9 Audio Recording Component""",
        "labels": ["frontend"]
    },
    {
        "title": "Audio Recording Component",
        "body": """## Issue #9: Audio Recording Component

**Priority**: Medium  
**Estimated Time**: 5-6 hours  
**Dependencies**: Issue #8

### Description
Implement browser-based audio recording using the MediaRecorder API.

### Tasks
- [ ] Implement `RecordingModal` component
- [ ] Request microphone permissions
- [ ] Initialize MediaRecorder
- [ ] Implement start/stop recording
- [ ] Add timer display
- [ ] Add title input field
- [ ] Create audio Blob when stopped
- [ ] Upload recorded audio
- [ ] Handle errors
- [ ] Integrate with HomePage

### Acceptance Criteria
- ✅ Can record audio in browser
- ✅ Timer displays recording duration
- ✅ Can stop and save recording
- ✅ Recorded audio is uploaded
- ✅ Microphone permissions are handled

### Files to Modify
- `frontend/src/components/RecordingModal.js`
- `frontend/src/components/RecordButton.js`
- `frontend/src/pages/HomePage.js`

### Resources
- [MDN MediaRecorder API](https://developer.mozilla.org/en-US/docs/Web/API/MediaRecorder)

---
**Previous Issue**: #8 File Upload Component  
**Next Issue**: #10 Meetings List Page""",
        "labels": ["frontend"]
    },
    {
        "title": "Meetings List Page",
        "body": """## Issue #10: Meetings List Page

**Priority**: High  
**Estimated Time**: 4-5 hours  
**Dependencies**: Issue #9

### Description
Implement the meetings list page with pagination.

### Tasks
- [ ] Implement `getMeetings()` in `services/api.js`
- [ ] Implement `MeetingCard` component
- [ ] Fetch meetings on page load
- [ ] Display meetings in grid layout
- [ ] Implement pagination controls
- [ ] Show loading spinner
- [ ] Handle empty state
- [ ] Navigate to detail page on card click

### Acceptance Criteria
- ✅ Meetings are fetched and displayed
- ✅ Grid layout is responsive
- ✅ Pagination works correctly
- ✅ Can navigate to meeting details

### Files to Modify
- `frontend/src/pages/MeetingsListPage.js`
- `frontend/src/components/MeetingCard.js`
- `frontend/src/services/api.js`

### Resources
- [React useEffect](https://react.dev/reference/react/useEffect)

---
**Previous Issue**: #9 Audio Recording  
**Next Issue**: #11 Meeting Detail Page""",
        "labels": ["frontend"]
    },
    {
        "title": "Meeting Detail Page",
        "body": """## Issue #11: Meeting Detail Page

**Priority**: High  
**Estimated Time**: 5-6 hours  
**Dependencies**: Issue #10

### Description
Implement the meeting detail page showing full meeting information.

### Tasks
- [ ] Implement `getMeeting()` in `services/api.js`
- [ ] Implement `MeetingDetail` component
- [ ] Implement `ActionItem` component
- [ ] Fetch meeting data using ID from URL
- [ ] Display all meeting information
- [ ] Implement collapsible transcript
- [ ] Add copy to clipboard functionality
- [ ] Implement delete functionality
- [ ] Add back button

### Acceptance Criteria
- ✅ Meeting details are displayed correctly
- ✅ Transcript is collapsible
- ✅ Copy button works
- ✅ Delete button works with confirmation

### Files to Modify
- `frontend/src/pages/MeetingDetailPage.js`
- `frontend/src/components/MeetingDetail.js`
- `frontend/src/components/ActionItem.js`
- `frontend/src/services/api.js`

### Resources
- [React useParams](https://reactrouter.com/en/main/hooks/use-params)

---
**Previous Issue**: #10 Meetings List  
**Next Issue**: #12 Processing Status""",
        "labels": ["frontend"]
    },
    {
        "title": "Processing Status and Polling",
        "body": """## Issue #12: Processing Status and Polling

**Priority**: High  
**Estimated Time**: 4-5 hours  
**Dependencies**: Issue #11

### Description
Implement the processing page that polls for completion and redirects when done.

### Tasks
- [ ] Implement `getMeetingStatus()` in `services/api.js`
- [ ] Implement `LoadingSpinner` component
- [ ] Implement `ProgressBar` component
- [ ] Set up polling interval
- [ ] Display loading spinner and progress
- [ ] Redirect to detail page when complete
- [ ] Handle errors
- [ ] Clean up interval on unmount

### Acceptance Criteria
- ✅ Processing page polls for status
- ✅ Loading spinner is displayed
- ✅ Redirects when processing complete
- ✅ Polling stops on unmount

### Files to Modify
- `frontend/src/pages/ProcessingPage.js`
- `frontend/src/components/LoadingSpinner.js`
- `frontend/src/components/ProgressBar.js`
- `frontend/src/services/api.js`

### Resources
- [React useEffect Cleanup](https://react.dev/reference/react/useEffect#connecting-to-an-external-system)

---
**Previous Issue**: #11 Meeting Detail  
**Next Issue**: #13 Error Handling""",
        "labels": ["frontend", "backend"]
    },
    {
        "title": "Error Handling Implementation",
        "body": """## Issue #13: Error Handling Implementation

**Priority**: Medium  
**Estimated Time**: 3-4 hours  
**Dependencies**: Issue #12

### Description
Add comprehensive error handling throughout the application.

### Tasks
- [ ] Add try/catch blocks to all API calls
- [ ] Display user-friendly error messages
- [ ] Handle network errors
- [ ] Handle API errors
- [ ] Handle file validation errors
- [ ] Handle microphone permission errors
- [ ] Add error state to all pages
- [ ] Test all error scenarios

### Acceptance Criteria
- ✅ All errors show user-friendly messages
- ✅ Network errors are handled
- ✅ API errors display appropriate messages
- ✅ App doesn't crash on errors

### Files to Modify
- All `frontend/src/pages/*.js` files
- All `frontend/src/components/*.js` files
- `frontend/src/services/api.js`

### Resources
- [Axios Error Handling](https://axios-http.com/docs/handling_errors)

---
**Previous Issue**: #12 Processing Status  
**Next Issue**: #14 UI Styling""",
        "labels": ["frontend", "backend"]
    },
    {
        "title": "UI Styling and Responsiveness",
        "body": """## Issue #14: UI Styling and Responsiveness

**Priority**: Medium  
**Estimated Time**: 6-8 hours  
**Dependencies**: Issue #13

### Description
Apply CSS styling to all components and make the layout responsive.

### Tasks
- [ ] Apply color scheme from PRD
- [ ] Style all buttons
- [ ] Style all cards
- [ ] Style all input fields
- [ ] Style all pages
- [ ] Style loading spinner
- [ ] Style progress bar
- [ ] Make layout responsive
- [ ] Add hover effects
- [ ] Add transitions
- [ ] Test on different screen sizes

### Acceptance Criteria
- ✅ All components are styled
- ✅ Color scheme matches PRD
- ✅ Layout is responsive
- ✅ Buttons have hover effects
- ✅ Loading animations work

### Files to Modify
- `frontend/src/styles/components.css`
- `frontend/src/styles/pages.css`
- `frontend/src/App.css`

### Resources
- [CSS Flexbox Guide](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [CSS Grid Guide](https://css-tricks.com/snippets/css/complete-guide-grid/)

---
**Previous Issue**: #13 Error Handling  
**Next Issue**: #15 Testing and Polish""",
        "labels": ["frontend", "design"]
    },
    {
        "title": "Testing, Documentation, and Final Polish",
        "body": """## Issue #15: Testing, Documentation, and Final Polish

**Priority**: High  
**Estimated Time**: 4-6 hours  
**Dependencies**: Issue #14

### Description
Test all features, fix bugs, and finalize documentation.

### Tasks
- [ ] Test all features end-to-end
- [ ] Test with different audio files
- [ ] Test error scenarios
- [ ] Fix any bugs found
- [ ] Update README
- [ ] Add code comments
- [ ] Remove console.log statements
- [ ] Check for unused imports
- [ ] Test on different browsers
- [ ] Prepare demo/presentation

### Acceptance Criteria
- ✅ All features work correctly
- ✅ No console errors
- ✅ No bugs in core functionality
- ✅ README is complete
- ✅ Code is clean and commented
- ✅ Ready for demo

### Files to Modify
- `README.md`
- All code files (cleanup)

### Testing Checklist
- [ ] Upload audio file
- [ ] Record audio
- [ ] View processing status
- [ ] View meeting detail
- [ ] View meetings list
- [ ] Delete meeting
- [ ] Test pagination
- [ ] Test error handling

---
**Previous Issue**: #14 UI Styling  
**Congratulations!** 🎉 You've completed all issues!""",
        "labels": ["testing", "documentation"]
    }
]

def create_issues(token):
    """Create all issues using GitHub API"""
    headers = {
        "Authorization": f"token {token}",
        "Accept": "application/vnd.github.v3+json"
    }
    
    base_url = f"https://api.github.com/repos/{REPO_OWNER}/{REPO_NAME}/issues"
    
    print(f"Creating {len(ISSUES)} GitHub issues...")
    print(f"Repository: {REPO_OWNER}/{REPO_NAME}\n")
    
    created_count = 0
    for i, issue in enumerate(ISSUES, 1):
        print(f"Creating Issue #{i}: {issue['title']}...")
        
        data = {
            "title": issue["title"],
            "body": issue["body"],
            "labels": issue["labels"]
        }
        
        try:
            response = requests.post(base_url, headers=headers, json=data)
            
            if response.status_code == 201:
                issue_number = response.json()["number"]
                print(f"  ✅ Created as issue #{issue_number}")
                created_count += 1
            else:
                print(f"  ❌ Failed: {response.status_code} - {response.json().get('message', 'Unknown error')}")
        except Exception as e:
            print(f"  ❌ Error: {str(e)}")
    
    print(f"\n{'='*60}")
    print(f"✅ Successfully created {created_count}/{len(ISSUES)} issues!")
    print(f"View them at: https://github.com/{REPO_OWNER}/{REPO_NAME}/issues")
    print(f"{'='*60}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 create_github_issues.py <github_token>")
        print("\nGet a token from: https://github.com/settings/tokens")
        print("Required scopes: repo")
        sys.exit(1)
    
    token = sys.argv[1]
    create_issues(token)

