import React from 'react';

/**
 * UploadButton Component
 * 
 * Renders a button that allows users to select and upload audio files
 * 
 * Props:
 *   - onFileSelect: Function called when a file is selected
 *   - disabled: Boolean to disable the button
 * 
 * TODO: Implement this component
 * - Create file input element (hidden)
 * - Create visible button that triggers file input
 * - Handle file selection
 * - Validate file type and size
 * - Call onFileSelect with the file
 */

function UploadButton({ onFileSelect, disabled }) {
  // TODO: Implement file upload logic
  
  return (
    <div className="upload-button">
      {/* TODO: Add file input and button */}
      <button disabled={disabled}>
        Upload Audio File
      </button>
    </div>
  );
}

export default UploadButton;

