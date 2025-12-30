# Creating GitHub Issues

This directory contains scripts to create all 15 GitHub issues for the Meeting Note Taker project.

## Option 1: Using Python Script (Recommended)

### Prerequisites
- Python 3.x
- GitHub Personal Access Token with `repo` scope

### Steps

1. Get a GitHub Personal Access Token:
   - Go to https://github.com/settings/tokens
   - Click "Generate new token" (classic)
   - Give it a name like "Meeting Note Taker Issues"
   - Select the `repo` scope
   - Click "Generate token"
   - Copy the token (you won't see it again!)

2. Run the Python script:
```bash
python3 create_github_issues.py YOUR_GITHUB_TOKEN_HERE
```

The script will create all 15 issues in the repository.

## Option 2: Using Bash Script (Requires gh CLI)

### Prerequisites
- GitHub CLI (`gh`) installed and authenticated
- Run: `gh auth login` to authenticate

### Steps

```bash
chmod +x create-issues.sh
./create-issues.sh
```

## Option 3: Manual Creation

If you prefer to create issues manually, use the markdown files in `.github-issues/` directory as templates. Each file contains the complete issue description.

## Issue List

1. **Project Setup and Environment Configuration** - Setup
2. **Database Schema and Models** - Backend
3. **File Upload API Endpoint** - Backend
4. **Whisper API Integration for Transcription** - AI
5. **LangChain Agent Chain Implementation** - AI
6. **Meeting CRUD API Endpoints** - Backend
7. **React App Structure and Routing** - Frontend
8. **File Upload Component** - Frontend
9. **Audio Recording Component** - Frontend
10. **Meetings List Page** - Frontend
11. **Meeting Detail Page** - Frontend
12. **Processing Status and Polling** - Full-stack
13. **Error Handling Implementation** - Full-stack
14. **UI Styling and Responsiveness** - Frontend
15. **Testing, Documentation, and Final Polish** - All

## Issue Dependencies

Issues should be completed in order as each builds on the previous one:
- Issues 1-6: Backend development
- Issues 7-12: Frontend development
- Issues 13-15: Polish and finalization

## Troubleshooting

### Python script fails
- Verify your GitHub token is valid
- Check you have `repo` scope enabled
- Ensure you have internet connection

### Bash script fails
- Install gh CLI: `brew install gh` (macOS) or see https://cli.github.com/
- Authenticate: `gh auth login`

### Rate limiting
If you hit GitHub API rate limits, wait an hour and try again.

