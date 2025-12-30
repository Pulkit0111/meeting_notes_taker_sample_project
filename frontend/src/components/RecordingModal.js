import React, { useState } from 'react';

/**
 * RecordingModal Component
 * 
 * Modal for recording audio directly in the browser
 * 
 * Props:
 *   - isOpen: Boolean to control modal visibility
 *   - onClose: Function called when modal is closed
 *   - onSave: Function called when recording is saved (receives audio blob and title)
 * 
 * TODO: Implement this component
 * - Create modal overlay and content
 * - Implement MediaRecorder API for audio recording
 * - Add timer display
 * - Add title input field
 * - Add record/stop/cancel buttons
 * - Handle audio blob creation
 * - Call onSave with audio blob and title
 */

function RecordingModal({ isOpen, onClose, onSave }) {
  const [recording, setRecording] = useState(false);
  const [timer, setTimer] = useState(0);
  const [title, setTitle] = useState('');
  
  // TODO: Implement recording logic
  // - Use MediaRecorder API
  // - Track recording time
  // - Handle start/stop recording
  
  if (!isOpen) return null;
  
  return (
    <div className="modal-overlay">
      <div className="modal-content">
        <h2>Record Meeting Audio</h2>
        
        {/* TODO: Add recording UI */}
        <div className="recording-controls">
          <p>Recording controls go here</p>
        </div>
        
        <div className="modal-actions">
          <button onClick={onClose}>Cancel</button>
          <button>Stop & Save</button>
        </div>
      </div>
    </div>
  );
}

export default RecordingModal;

