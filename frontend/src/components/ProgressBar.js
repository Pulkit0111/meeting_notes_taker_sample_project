import React from 'react';

/**
 * ProgressBar Component
 * 
 * Displays a progress bar
 * 
 * Props:
 *   - progress: Number between 0 and 100
 *   - label: Optional label to display
 * 
 * TODO: Implement this component
 * - Create progress bar with fill
 * - Display percentage
 * - Apply styling with primary color
 */

function ProgressBar({ progress = 0, label }) {
  // TODO: Implement progress bar UI
  
  return (
    <div className="progress-bar-container">
      {label && <p className="progress-label">{label}</p>}
      <div className="progress-bar">
        <div 
          className="progress-fill" 
          style={{ width: `${progress}%` }}
        ></div>
      </div>
      <p className="progress-percentage">{progress}%</p>
    </div>
  );
}

export default ProgressBar;

