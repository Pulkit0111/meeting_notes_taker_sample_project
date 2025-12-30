import axios from 'axios';

// TODO: Get API URL from environment variable
const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:8000';

// Create axios instance with default config
const api = axios.create({
  baseURL: API_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

/**
 * Upload and process a meeting audio file
 * 
 * @param {File} audioFile - Audio file to upload
 * @param {string} title - Optional meeting title
 * @returns {Promise} Response with meeting_id and status
 * 
 * TODO: Implement this function
 * - Create FormData with audio file and title
 * - POST to /api/meetings/upload
 * - Return response data
 */
export const uploadMeeting = async (audioFile, title = null) => {
  // TODO: Implement upload
  throw new Error('uploadMeeting not implemented');
};

/**
 * Get processing status of a meeting
 * 
 * @param {number} meetingId - ID of the meeting
 * @returns {Promise} Response with status and progress
 * 
 * TODO: Implement this function
 * - GET from /api/meetings/{meetingId}/status
 * - Return response data
 */
export const getMeetingStatus = async (meetingId) => {
  // TODO: Implement status check
  throw new Error('getMeetingStatus not implemented');
};

/**
 * Get full details of a meeting
 * 
 * @param {number} meetingId - ID of the meeting
 * @returns {Promise} Response with full meeting data
 * 
 * TODO: Implement this function
 * - GET from /api/meetings/{meetingId}
 * - Return response data
 */
export const getMeeting = async (meetingId) => {
  // TODO: Implement meeting retrieval
  throw new Error('getMeeting not implemented');
};

/**
 * Get paginated list of meetings
 * 
 * @param {number} page - Page number (default: 1)
 * @param {number} limit - Items per page (default: 10)
 * @returns {Promise} Response with meetings array and pagination data
 * 
 * TODO: Implement this function
 * - GET from /api/meetings?page={page}&limit={limit}
 * - Return response data
 */
export const getMeetings = async (page = 1, limit = 10) => {
  // TODO: Implement meetings list
  throw new Error('getMeetings not implemented');
};

/**
 * Get recent meetings (for home page)
 * 
 * @param {number} limit - Number of meetings to fetch (default: 5)
 * @returns {Promise} Response with recent meetings
 * 
 * TODO: Implement this function
 * - Use getMeetings with limit parameter
 * - Return first page of meetings
 */
export const getRecentMeetings = async (limit = 5) => {
  // TODO: Implement recent meetings
  throw new Error('getRecentMeetings not implemented');
};

/**
 * Delete a meeting
 * 
 * @param {number} meetingId - ID of the meeting to delete
 * @returns {Promise} Response (204 No Content)
 * 
 * TODO: Implement this function
 * - DELETE to /api/meetings/{meetingId}
 * - Return response
 */
export const deleteMeeting = async (meetingId) => {
  // TODO: Implement meeting deletion
  throw new Error('deleteMeeting not implemented');
};

export default api;

