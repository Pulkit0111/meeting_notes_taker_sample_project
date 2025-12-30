#!/bin/bash

# Script to create GitHub issues for Meeting Note Taker project
# Usage: ./create-issues.sh
# Requires: gh CLI installed and authenticated

REPO="Pulkit0111/meeting_notes_taker_sample_project"

echo "Creating 15 GitHub issues for Meeting Note Taker project..."
echo "Repository: $REPO"
echo ""

# Issue #1
echo "Creating Issue #1..."
gh issue create --repo "$REPO" \
  --title "Project Setup and Environment Configuration" \
  --label "setup,backend,frontend" \
  --body "## Issue #1: Project Setup and Environment Configuration

**Priority**: High  
**Estimated Time**: 4-6 hours  
**Dependencies**: None

### Description
Set up the development environment for both backend and frontend. This is the foundation for all subsequent work.

### Tasks
- [ ] Install Python 3.9+ and verify installation
- [ ] Install Node.js 16+ and verify installation
- [ ] Create Python virtual environment in \`backend/\` directory
- [ ] Install backend dependencies from \`requirements.txt\`
- [ ] Install frontend dependencies with \`npm install\`
- [ ] Get OpenAI API key from platform.openai.com
- [ ] Create \`.env\` file in backend from \`.env.example\`
- [ ] Add OPENAI_API_KEY to \`.env\` file
- [ ] Create \`.env\` file in frontend from \`.env.example\`
- [ ] Test backend server runs: \`uvicorn main:app --reload --port 8000\`
- [ ] Test frontend runs: \`npm start\`
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
- \`backend/.env\` (create from .env.example)
- \`frontend/.env\` (create from .env.example)

### Hints
- Make sure to activate the virtual environment before installing Python packages
- On Windows, use \`venv\\Scripts\\activate\` instead of \`source venv/bin/activate\`
- Keep both servers running in separate terminal windows

### Resources
- [Python Virtual Environments](https://docs.python.org/3/tutorial/venv.html)
- [FastAPI First Steps](https://fastapi.tiangolo.com/tutorial/first-steps/)

---
**Next Issue**: #2 Database Schema and Models"

# Issue #2
echo "Creating Issue #2..."
gh issue create --repo "$REPO" \
  --title "Database Schema and Models" \
  --label "backend,database" \
  --body "## Issue #2: Database Schema and Models

**Priority**: High  
**Estimated Time**: 3-4 hours  
**Dependencies**: Issue #1

### Description
Implement the SQLAlchemy database models and create the meetings table schema.

### Tasks
- [ ] Uncomment and implement the \`Meeting\` model in \`database.py\`
- [ ] Define all columns according to PRD schema:
  - id (INTEGER, PRIMARY KEY)
  - title (TEXT, NOT NULL)
  - audio_filename (TEXT, NOT NULL)
  - transcript (TEXT, NOT NULL)
  - summary (TEXT, NOT NULL)
  - key_points (TEXT, NOT NULL) - JSON string
  - action_items (TEXT, NOT NULL) - JSON string
  - duration (INTEGER, NULLABLE)
  - created_at (TIMESTAMP, DEFAULT NOW)
- [ ] Uncomment and implement \`create_engine\`
- [ ] Uncomment and implement \`SessionLocal\`
- [ ] Implement \`init_db()\` function
- [ ] Implement \`get_db()\` dependency
- [ ] Test database creation
- [ ] Verify table structure with SQLite browser or command line

### Acceptance Criteria
- ✅ Database file is created when server starts
- ✅ \`meetings\` table exists with correct schema
- ✅ Can insert test records
- ✅ \`get_db()\` dependency works correctly
- ✅ No database connection errors

### Files to Modify
- \`backend/database.py\`

### Hints
- Use SQLAlchemy's declarative base for model definition
- Store JSON data as TEXT and parse/stringify in Python
- Test with: \`sqlite3 meetings.db\` then \`.schema meetings\`

### Resources
- [SQLAlchemy ORM Tutorial](https://docs.sqlalchemy.org/en/20/tutorial/orm_data_manipulation.html)
- [FastAPI SQL Databases](https://fastapi.tiangolo.com/tutorial/sql-databases/)

### Testing
```python
# Test in Python shell
from database import init_db, SessionLocal, Meeting
init_db()
db = SessionLocal()
print(db.query(Meeting).count())  # Should return 0
```

---
**Previous Issue**: #1 Project Setup  
**Next Issue**: #3 File Upload API Endpoint"

# Issue #3
echo "Creating Issue #3..."
gh issue create --repo "$REPO" \
  --title "File Upload API Endpoint" \
  --label "backend,api" \
  --body "## Issue #3: File Upload API Endpoint

**Priority**: High  
**Estimated Time**: 4-5 hours  
**Dependencies**: Issue #2

### Description
Implement the file upload endpoint that accepts audio files, validates them, and saves them to the uploads directory.

### Tasks
- [ ] Implement \`save_audio_file()\` in \`utils/storage.py\`
- [ ] Implement \`validate_audio_file()\` in \`utils/audio.py\`
- [ ] Implement \`upload_meeting()\` endpoint in \`routes/meetings.py\`
- [ ] Add file size validation (max 25MB)
- [ ] Add file type validation (MP3, WAV, M4A)
- [ ] Generate unique filename with timestamp
- [ ] Create meeting record in database with \"processing\" status
- [ ] Return meeting_id and status
- [ ] Include router in \`main.py\`
- [ ] Test with Postman or curl

### Acceptance Criteria
- ✅ Can upload audio files via POST /api/meetings/upload
- ✅ Files are saved to uploads/ directory
- ✅ Invalid file types are rejected with 400 error
- ✅ Files over 25MB are rejected with 400 error
- ✅ Meeting record is created in database
- ✅ Returns correct response format

### Files to Modify
- \`backend/routes/meetings.py\`
- \`backend/utils/storage.py\`
- \`backend/utils/audio.py\`
- \`backend/main.py\` (include router)

### Hints
- Use FastAPI's \`UploadFile\` for file handling
- Check \`file.content_type\` for MIME type validation
- Use \`file.size\` or read chunks to check file size
- Generate filename: \`f\"meeting_{int(time.time())}.{extension}\"\`

### Resources
- [FastAPI File Uploads](https://fastapi.tiangolo.com/tutorial/request-files/)
- [Python File Handling](https://docs.python.org/3/tutorial/inputoutput.html#reading-and-writing-files)

### Testing
```bash
curl -X POST http://localhost:8000/api/meetings/upload \\
  -F \"audio_file=@test.mp3\" \\
  -F \"title=Test Meeting\"
```

---
**Previous Issue**: #2 Database Schema  
**Next Issue**: #4 Whisper API Integration"

# Issue #4
echo "Creating Issue #4..."
gh issue create --repo "$REPO" \
  --title "Whisper API Integration for Transcription" \
  --label "backend,ai" \
  --body "## Issue #4: Whisper API Integration for Transcription

**Priority**: High  
**Estimated Time**: 3-4 hours  
**Dependencies**: Issue #3

### Description
Integrate OpenAI Whisper API to transcribe audio files to text.

### Tasks
- [ ] Implement \`transcribe_audio()\` in \`utils/audio.py\`
- [ ] Initialize OpenAI client with API key
- [ ] Open and read audio file
- [ ] Call Whisper API with audio file
- [ ] Handle API errors (rate limits, invalid files)
- [ ] Return transcription text
- [ ] Update \`upload_meeting()\` to call transcription
- [ ] Store transcript in database
- [ ] Test with sample audio files

### Acceptance Criteria
- ✅ Audio files are successfully transcribed
- ✅ Transcript is stored in database
- ✅ API errors are handled gracefully
- ✅ Works with MP3, WAV, and M4A files
- ✅ Returns accurate transcription

### Files to Modify
- \`backend/utils/audio.py\`
- \`backend/routes/meetings.py\` (call transcription)

### Hints
- Use \`openai.Audio.transcribe()\` method
- Open file in binary mode: \`open(path, \"rb\")\`
- Whisper API accepts files up to 25MB
- Handle exceptions: \`openai.error.APIError\`

### Resources
- [OpenAI Whisper API Docs](https://platform.openai.com/docs/guides/speech-to-text)
- [OpenAI Python SDK](https://github.com/openai/openai-python)

### Testing
```python
from utils.audio import transcribe_audio
transcript = transcribe_audio(\"uploads/test.mp3\")
print(transcript)
```

---
**Previous Issue**: #3 File Upload  
**Next Issue**: #5 LangChain Agents"

# Issue #5
echo "Creating Issue #5..."
gh issue create --repo "$REPO" \
  --title "LangChain Agent Chain Implementation" \
  --label "backend,ai" \
  --body "## Issue #5: LangChain Agent Chain Implementation

**Priority**: High  
**Estimated Time**: 5-6 hours  
**Dependencies**: Issue #4

### Description
Implement LangChain agents to analyze meeting transcripts and extract structured information.

### Tasks
- [ ] Initialize OpenAI LLM in \`agents/meeting_agent.py\`
- [ ] Implement \`create_summary_chain()\`
- [ ] Implement \`create_key_points_chain()\`
- [ ] Implement \`create_action_items_chain()\`
- [ ] Implement \`create_meeting_analysis_chain()\` (combine all)
- [ ] Implement \`parse_chain_output()\` to clean JSON responses
- [ ] Implement \`analyze_meeting()\` main function
- [ ] Test with sample transcripts
- [ ] Handle malformed JSON from LLM
- [ ] Update upload endpoint to call analysis

### Acceptance Criteria
- ✅ Summary is generated (3-5 sentences)
- ✅ Key points are extracted (3-5 items)
- ✅ Action items are extracted
- ✅ Output is properly formatted JSON
- ✅ Malformed JSON is handled with fallback parsing
- ✅ All data is stored in database

### Files to Modify
- \`backend/agents/meeting_agent.py\`
- \`backend/routes/meetings.py\` (call analysis)

### Hints
- Use \`SequentialChain\` to combine chains
- Prompt LLM to return JSON arrays
- Handle markdown code blocks in responses
- Use try/except for JSON parsing with fallback

### Resources
- [LangChain Chains](https://python.langchain.com/docs/modules/chains/)
- [LangChain Prompts](https://python.langchain.com/docs/modules/model_io/prompts/)

### Testing
```python
from agents.meeting_agent import analyze_meeting
result = analyze_meeting(\"Sample transcript...\")
print(result)
```

---
**Previous Issue**: #4 Whisper Integration  
**Next Issue**: #6 Meeting CRUD APIs"

# Issue #6
echo "Creating Issue #6..."
gh issue create --repo "$REPO" \
  --title "Meeting CRUD API Endpoints" \
  --label "backend,api" \
  --body "## Issue #6: Meeting CRUD API Endpoints

**Priority**: High  
**Estimated Time**: 4-5 hours  
**Dependencies**: Issue #5

### Description
Implement the remaining API endpoints for retrieving, listing, and deleting meetings.

### Tasks
- [ ] Implement \`get_meeting(meeting_id)\` endpoint
- [ ] Implement \`list_meetings(page, limit)\` endpoint
- [ ] Implement \`get_meeting_status(meeting_id)\` endpoint
- [ ] Implement \`delete_meeting(meeting_id)\` endpoint
- [ ] Implement \`delete_audio_file()\` in \`utils/storage.py\`
- [ ] Add pagination logic for list endpoint
- [ ] Parse JSON fields (key_points, action_items) before returning
- [ ] Handle 404 errors for missing meetings
- [ ] Test all endpoints with Postman

### Acceptance Criteria
- ✅ GET /api/meetings returns paginated list
- ✅ GET /api/meetings/{id} returns full meeting data
- ✅ GET /api/meetings/{id}/status returns processing status
- ✅ DELETE /api/meetings/{id} removes meeting and file
- ✅ 404 errors for non-existent meetings
- ✅ Pagination works correctly

### Files to Modify
- \`backend/routes/meetings.py\`
- \`backend/utils/storage.py\`

### Hints
- Use SQLAlchemy's \`.offset()\` and \`.limit()\` for pagination
- Calculate total pages: \`math.ceil(total / limit)\`
- Use \`json.loads()\` to parse JSON strings
- Delete file before deleting database record

### Resources
- [FastAPI Path Parameters](https://fastapi.tiangolo.com/tutorial/path-params/)
- [FastAPI Query Parameters](https://fastapi.tiangolo.com/tutorial/query-params/)

### Testing
```bash
# List meetings
curl http://localhost:8000/api/meetings?page=1&limit=10

# Get meeting
curl http://localhost:8000/api/meetings/1

# Delete meeting
curl -X DELETE http://localhost:8000/api/meetings/1
```

---
**Previous Issue**: #5 LangChain Agents  
**Next Issue**: #7 React App Structure"

# Issue #7
echo "Creating Issue #7..."
gh issue create --repo "$REPO" \
  --title "React App Structure and Routing" \
  --label "frontend" \
  --body "## Issue #7: React App Structure and Routing

**Priority**: High  
**Estimated Time**: 3-4 hours  
**Dependencies**: Issue #6

### Description
Set up React Router and create the basic page structure for the application.

### Tasks
- [ ] Uncomment imports in \`App.js\`
- [ ] Define routes for all pages:
  - / → HomePage
  - /meetings → MeetingsListPage
  - /meetings/:id → MeetingDetailPage
  - /processing/:id → ProcessingPage
- [ ] Create basic page layouts (no functionality yet)
- [ ] Add navigation between pages
- [ ] Test routing works without page refresh
- [ ] Add 404 page (optional)

### Acceptance Criteria
- ✅ All routes are defined and working
- ✅ Can navigate between pages
- ✅ URL changes without page refresh
- ✅ Each page displays placeholder content
- ✅ No console errors

### Files to Modify
- \`frontend/src/App.js\`
- \`frontend/src/pages/HomePage.js\`
- \`frontend/src/pages/MeetingsListPage.js\`
- \`frontend/src/pages/MeetingDetailPage.js\`
- \`frontend/src/pages/ProcessingPage.js\`

### Hints
- Use \`<Link>\` from react-router-dom for navigation
- Use \`useNavigate()\` hook for programmatic navigation
- Use \`useParams()\` to get URL parameters

### Resources
- [React Router Tutorial](https://reactrouter.com/en/main/start/tutorial)
- [React Router Hooks](https://reactrouter.com/en/main/hooks/use-navigate)

### Testing
- Click through all pages manually
- Check browser URL updates correctly
- Use browser back/forward buttons

---
**Previous Issue**: #6 Meeting CRUD APIs  
**Next Issue**: #8 File Upload Component"

# Issue #8
echo "Creating Issue #8..."
gh issue create --repo "$REPO" \
  --title "File Upload Component" \
  --label "frontend" \
  --body "## Issue #8: File Upload Component

**Priority**: High  
**Estimated Time**: 4-5 hours  
**Dependencies**: Issue #7

### Description
Implement the file upload component and connect it to the backend API.

### Tasks
- [ ] Implement \`UploadButton\` component
- [ ] Add hidden file input element
- [ ] Handle file selection
- [ ] Validate file type and size on client side
- [ ] Implement \`uploadMeeting()\` in \`services/api.js\`
- [ ] Create FormData and send to backend
- [ ] Handle upload response
- [ ] Show loading state during upload
- [ ] Navigate to processing page after upload
- [ ] Display error messages
- [ ] Integrate into HomePage

### Acceptance Criteria
- ✅ Can select audio files from file picker
- ✅ Invalid files show error message
- ✅ Files are uploaded to backend
- ✅ Loading state is displayed
- ✅ Redirects to processing page after upload
- ✅ Error handling works

### Files to Modify
- \`frontend/src/components/UploadButton.js\`
- \`frontend/src/services/api.js\`
- \`frontend/src/pages/HomePage.js\`

### Hints
- Use \`<input type=\"file\" accept=\"audio/*\">\`
- Check \`file.size\` and \`file.type\` before upload
- Use FormData: \`formData.append('audio_file', file)\`
- Set Content-Type header to 'multipart/form-data'

### Resources
- [MDN File API](https://developer.mozilla.org/en-US/docs/Web/API/File)
- [Axios FormData](https://axios-http.com/docs/multipart)

### Testing
- Upload valid audio files (MP3, WAV, M4A)
- Try uploading invalid file types
- Try uploading files > 25MB
- Check network tab in browser DevTools

---
**Previous Issue**: #7 React App Structure  
**Next Issue**: #9 Audio Recording Component"

# Issue #9
echo "Creating Issue #9..."
gh issue create --repo "$REPO" \
  --title "Audio Recording Component" \
  --label "frontend" \
  --body "## Issue #9: Audio Recording Component

**Priority**: Medium  
**Estimated Time**: 5-6 hours  
**Dependencies**: Issue #8

### Description
Implement browser-based audio recording using the MediaRecorder API.

### Tasks
- [ ] Implement \`RecordingModal\` component
- [ ] Request microphone permissions
- [ ] Initialize MediaRecorder
- [ ] Implement start/stop recording
- [ ] Add timer display (MM:SS format)
- [ ] Add title input field
- [ ] Collect audio chunks
- [ ] Create audio Blob when stopped
- [ ] Convert Blob to File
- [ ] Call upload API with recorded audio
- [ ] Handle errors (no microphone, permissions denied)
- [ ] Integrate with HomePage

### Acceptance Criteria
- ✅ Can record audio in browser
- ✅ Timer displays recording duration
- ✅ Can stop and save recording
- ✅ Can cancel recording
- ✅ Recorded audio is uploaded to backend
- ✅ Microphone permissions are handled
- ✅ Works in Chrome, Firefox, Safari

### Files to Modify
- \`frontend/src/components/RecordingModal.js\`
- \`frontend/src/components/RecordButton.js\`
- \`frontend/src/pages/HomePage.js\`

### Hints
- Use \`navigator.mediaDevices.getUserMedia({ audio: true })\`
- Create MediaRecorder: \`new MediaRecorder(stream)\`
- Collect chunks in \`ondataavailable\` event
- Create Blob: \`new Blob(chunks, { type: 'audio/webm' })\`
- Convert to File: \`new File([blob], filename, { type: blob.type })\`

### Resources
- [MDN MediaRecorder API](https://developer.mozilla.org/en-US/docs/Web/API/MediaRecorder)
- [MDN getUserMedia](https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices/getUserMedia)

### Testing
- Test recording and saving
- Test cancel button
- Test without microphone
- Test denying permissions

---
**Previous Issue**: #8 File Upload Component  
**Next Issue**: #10 Meetings List Page"

# Issue #10
echo "Creating Issue #10..."
gh issue create --repo "$REPO" \
  --title "Meetings List Page" \
  --label "frontend" \
  --body "## Issue #10: Meetings List Page

**Priority**: High  
**Estimated Time**: 4-5 hours  
**Dependencies**: Issue #9

### Description
Implement the meetings list page with pagination.

### Tasks
- [ ] Implement \`getMeetings()\` in \`services/api.js\`
- [ ] Implement \`MeetingCard\` component
- [ ] Fetch meetings on page load
- [ ] Display meetings in grid layout
- [ ] Implement pagination controls
- [ ] Handle page changes
- [ ] Show loading spinner while fetching
- [ ] Handle empty state (no meetings)
- [ ] Handle errors
- [ ] Navigate to detail page on card click

### Acceptance Criteria
- ✅ Meetings are fetched and displayed
- ✅ Grid layout is responsive
- ✅ Pagination works correctly
- ✅ Loading state is shown
- ✅ Empty state is handled
- ✅ Can navigate to meeting details
- ✅ Most recent meetings appear first

### Files to Modify
- \`frontend/src/pages/MeetingsListPage.js\`
- \`frontend/src/components/MeetingCard.js\`
- \`frontend/src/services/api.js\`

### Hints
- Use \`useEffect\` to fetch on mount and page change
- Use CSS Grid or Flexbox for layout
- Format dates with \`new Date().toLocaleDateString()\`
- Truncate summary with CSS: \`text-overflow: ellipsis\`

### Resources
- [React useEffect](https://react.dev/reference/react/useEffect)
- [CSS Grid Layout](https://css-tricks.com/snippets/css/complete-guide-grid/)

### Testing
- Navigate to /meetings
- Check pagination works
- Click on meeting cards
- Test with 0 meetings, 1 meeting, many meetings

---
**Previous Issue**: #9 Audio Recording  
**Next Issue**: #11 Meeting Detail Page"

# Issue #11
echo "Creating Issue #11..."
gh issue create --repo "$REPO" \
  --title "Meeting Detail Page" \
  --label "frontend" \
  --body "## Issue #11: Meeting Detail Page

**Priority**: High  
**Estimated Time**: 5-6 hours  
**Dependencies**: Issue #10

### Description
Implement the meeting detail page showing full meeting information.

### Tasks
- [ ] Implement \`getMeeting()\` in \`services/api.js\`
- [ ] Implement \`MeetingDetail\` component
- [ ] Implement \`ActionItem\` component
- [ ] Fetch meeting data using ID from URL
- [ ] Display all meeting information:
  - Title, date, duration
  - Summary (highlighted card)
  - Key points (bullet list)
  - Action items (checkbox list)
  - Full transcript (collapsible)
- [ ] Implement collapsible transcript section
- [ ] Add copy to clipboard functionality
- [ ] Implement delete functionality
- [ ] Handle loading and error states
- [ ] Add back button

### Acceptance Criteria
- ✅ Meeting details are displayed correctly
- ✅ Summary is highlighted
- ✅ Key points are formatted as bullets
- ✅ Action items show checkboxes
- ✅ Transcript is collapsible
- ✅ Copy button works
- ✅ Delete button works with confirmation
- ✅ Back button navigates correctly

### Files to Modify
- \`frontend/src/pages/MeetingDetailPage.js\`
- \`frontend/src/components/MeetingDetail.js\`
- \`frontend/src/components/ActionItem.js\`
- \`frontend/src/services/api.js\`

### Hints
- Use \`useParams()\` to get meeting ID from URL
- Use \`window.confirm()\` for delete confirmation
- Copy to clipboard: \`navigator.clipboard.writeText(text)\`
- Toggle transcript with state: \`const [expanded, setExpanded] = useState(false)\`

### Resources
- [React useParams](https://reactrouter.com/en/main/hooks/use-params)
- [Clipboard API](https://developer.mozilla.org/en-US/docs/Web/API/Clipboard/writeText)

### Testing
- Navigate to meeting detail page
- Test all sections display correctly
- Test expand/collapse transcript
- Test copy button
- Test delete button

---
**Previous Issue**: #10 Meetings List  
**Next Issue**: #12 Processing Status"

# Issue #12
echo "Creating Issue #12..."
gh issue create --repo "$REPO" \
  --title "Processing Status and Polling" \
  --label "frontend,backend" \
  --body "## Issue #12: Processing Status and Polling

**Priority**: High  
**Estimated Time**: 4-5 hours  
**Dependencies**: Issue #11

### Description
Implement the processing page that polls for completion and redirects when done.

### Tasks
- [ ] Implement \`getMeetingStatus()\` in \`services/api.js\`
- [ ] Implement \`LoadingSpinner\` component
- [ ] Implement \`ProgressBar\` component
- [ ] Set up polling interval (every 2-3 seconds)
- [ ] Display loading spinner and progress
- [ ] Show status message
- [ ] Redirect to detail page when complete
- [ ] Handle errors
- [ ] Clean up interval on unmount
- [ ] Update upload/record flows to navigate here

### Acceptance Criteria
- ✅ Processing page polls for status
- ✅ Loading spinner is displayed
- ✅ Progress updates (if available)
- ✅ Redirects when processing complete
- ✅ Handles processing errors
- ✅ Polling stops on unmount
- ✅ Works after upload and recording

### Files to Modify
- \`frontend/src/pages/ProcessingPage.js\`
- \`frontend/src/components/LoadingSpinner.js\`
- \`frontend/src/components/ProgressBar.js\`
- \`frontend/src/services/api.js\`
- \`frontend/src/pages/HomePage.js\` (update navigation)

### Hints
- Use \`setInterval()\` for polling
- Clean up: \`useEffect(() => { return () => clearInterval(id) }, [])\`
- Use \`useNavigate()\` to redirect
- Poll every 2000-3000ms

### Resources
- [React useEffect Cleanup](https://react.dev/reference/react/useEffect#connecting-to-an-external-system)
- [setInterval MDN](https://developer.mozilla.org/en-US/docs/Web/API/setInterval)

### Testing
- Upload a file and verify redirect to processing
- Watch status updates
- Verify redirect to detail page when complete
- Test with fast and slow processing

---
**Previous Issue**: #11 Meeting Detail  
**Next Issue**: #13 Error Handling"

# Issue #13
echo "Creating Issue #13..."
gh issue create --repo "$REPO" \
  --title "Error Handling Implementation" \
  --label "frontend,backend" \
  --body "## Issue #13: Error Handling Implementation

**Priority**: Medium  
**Estimated Time**: 3-4 hours  
**Dependencies**: Issue #12

### Description
Add comprehensive error handling throughout the application.

### Tasks
- [ ] Add try/catch blocks to all API calls
- [ ] Display user-friendly error messages
- [ ] Handle network errors
- [ ] Handle API errors (400, 404, 500)
- [ ] Handle file validation errors
- [ ] Handle microphone permission errors
- [ ] Add error state to all pages
- [ ] Create error message component (optional)
- [ ] Test all error scenarios
- [ ] Add error logging (console.error)

### Acceptance Criteria
- ✅ All errors show user-friendly messages
- ✅ Network errors are handled
- ✅ API errors display appropriate messages
- ✅ File validation errors are clear
- ✅ No unhandled promise rejections
- ✅ App doesn't crash on errors

### Files to Modify
- All \`frontend/src/pages/*.js\` files
- All \`frontend/src/components/*.js\` files
- \`frontend/src/services/api.js\`

### Hints
- Use try/catch in async functions
- Check \`error.response.data.error\` for API errors
- Display errors in UI with state: \`const [error, setError] = useState(null)\`
- Clear errors when retrying

### Resources
- [Error Handling in React](https://react.dev/reference/react/Component#catching-rendering-errors-with-an-error-boundary)
- [Axios Error Handling](https://axios-http.com/docs/handling_errors)

### Testing
- Disconnect network and try actions
- Upload invalid files
- Try to access non-existent meeting
- Deny microphone permissions
- Check console for errors

---
**Previous Issue**: #12 Processing Status  
**Next Issue**: #14 UI Styling"

# Issue #14
echo "Creating Issue #14..."
gh issue create --repo "$REPO" \
  --title "UI Styling and Responsiveness" \
  --label "frontend,design" \
  --body "## Issue #14: UI Styling and Responsiveness

**Priority**: Medium  
**Estimated Time**: 6-8 hours  
**Dependencies**: Issue #13

### Description
Apply CSS styling to all components and make the layout responsive.

### Tasks
- [ ] Apply color scheme from PRD
- [ ] Style all buttons (primary, secondary, danger)
- [ ] Style all cards
- [ ] Style all input fields
- [ ] Style home page (hero section, buttons)
- [ ] Style recording modal
- [ ] Style meeting cards
- [ ] Style meeting detail page
- [ ] Style loading spinner (CSS animation)
- [ ] Style progress bar
- [ ] Make layout responsive (desktop, tablet)
- [ ] Add hover effects
- [ ] Add transitions
- [ ] Test on different screen sizes

### Acceptance Criteria
- ✅ All components are styled
- ✅ Color scheme matches PRD
- ✅ Layout is responsive (min 768px)
- ✅ Buttons have hover effects
- ✅ Loading animations work
- ✅ No layout breaks on smaller screens
- ✅ Typography is consistent

### Files to Modify
- \`frontend/src/styles/components.css\`
- \`frontend/src/styles/pages.css\`
- \`frontend/src/App.css\`
- \`frontend/src/index.css\`

### Hints
- Use CSS variables for colors
- Use flexbox/grid for layouts
- Use media queries for responsiveness
- Add \`transition: all 0.2s\` for smooth effects
- Use \`@keyframes\` for spinner animation

### Resources
- [CSS Flexbox Guide](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [CSS Grid Guide](https://css-tricks.com/snippets/css/complete-guide-grid/)
- [CSS Media Queries](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries)

### Testing
- View on desktop (1920px, 1440px, 1024px)
- View on tablet (768px)
- Test all interactions
- Check hover effects
- Verify animations work

---
**Previous Issue**: #13 Error Handling  
**Next Issue**: #15 Testing and Polish"

# Issue #15
echo "Creating Issue #15..."
gh issue create --repo "$REPO" \
  --title "Testing, Documentation, and Final Polish" \
  --label "testing,documentation" \
  --body "## Issue #15: Testing, Documentation, and Final Polish

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
- [ ] Update README with:
  - Project description
  - Setup instructions
  - Usage guide
  - Screenshots (optional)
- [ ] Add code comments where needed
- [ ] Remove console.log statements
- [ ] Check for unused imports
- [ ] Verify .env.example files are complete
- [ ] Test on different browsers
- [ ] Prepare demo/presentation

### Acceptance Criteria
- ✅ All features work correctly
- ✅ No console errors
- ✅ No bugs in core functionality
- ✅ README is complete and clear
- ✅ Code is clean and commented
- ✅ Ready for demo

### Files to Modify
- \`README.md\`
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
- [ ] Test on Chrome
- [ ] Test on Firefox
- [ ] Test on Safari

### Resources
- [Writing Good Documentation](https://www.writethedocs.org/guide/writing/beginners-guide-to-docs/)
- [README Best Practices](https://github.com/matiassingers/awesome-readme)

---
**Previous Issue**: #14 UI Styling  
**Congratulations!** 🎉 You've completed all issues!"

echo ""
echo "✅ All 15 issues created successfully!"
echo "View them at: https://github.com/$REPO/issues"

