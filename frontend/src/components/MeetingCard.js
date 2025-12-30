import React from 'react';
import { useNavigate } from 'react-router-dom';

/**
 * MeetingCard Component
 * 
 * Displays a summary card for a meeting
 * 
 * Props:
 *   - meeting: Object containing meeting data (id, title, summary, created_at)
 * 
 * TODO: Implement this component
 * - Display meeting title
 * - Display created date (formatted)
 * - Display summary preview (truncated)
 * - Add "View" button that navigates to detail page
 * - Apply card styling with hover effect
 */

function MeetingCard({ meeting }) {
  const navigate = useNavigate();
  
  // TODO: Implement card UI and navigation
  
  return (
    <div className="meeting-card">
      {/* TODO: Add meeting card content */}
      <h3>{meeting?.title || 'Meeting Title'}</h3>
      <p>{meeting?.summary || 'Summary preview...'}</p>
      <button onClick={() => navigate(`/meetings/${meeting?.id}`)}>
        View Details
      </button>
    </div>
  );
}

export default MeetingCard;

