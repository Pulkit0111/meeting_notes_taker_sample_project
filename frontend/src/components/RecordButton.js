import React from 'react';

/**
 * RecordButton Component
 * 
 * Renders a button that opens the recording modal
 * 
 * Props:
 *   - onClick: Function called when button is clicked
 *   - disabled: Boolean to disable the button
 * 
 * TODO: Implement this component
 * - Create button with microphone icon
 * - Handle click event
 * - Apply appropriate styling
 */

function RecordButton({ onClick, disabled }) {
  // TODO: Implement record button
  
  return (
    <div className="record-button">
      <button onClick={onClick} disabled={disabled}>
        Record Audio
      </button>
    </div>
  );
}

export default RecordButton;

