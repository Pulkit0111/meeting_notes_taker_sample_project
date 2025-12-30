import React from 'react';

/**
 * LoadingSpinner Component
 * 
 * Displays a loading spinner animation
 * 
 * Props:
 *   - size: Size of the spinner ('small', 'medium', 'large')
 *   - message: Optional message to display below spinner
 * 
 * TODO: Implement this component
 * - Create CSS spinner animation
 * - Support different sizes
 * - Display optional message
 */

function LoadingSpinner({ size = 'medium', message }) {
  // TODO: Implement spinner UI
  
  return (
    <div className={`loading-spinner loading-spinner-${size}`}>
      <div className="spinner"></div>
      {message && <p className="loading-message">{message}</p>}
    </div>
  );
}

export default LoadingSpinner;

