import React from 'react';

/**
 * ActionItem Component
 * 
 * Displays a single action item with checkbox
 * 
 * Props:
 *   - item: String containing the action item text
 *   - index: Index of the item in the list
 * 
 * TODO: Implement this component
 * - Display checkbox (non-interactive for MVP)
 * - Display action item text
 * - Apply appropriate styling
 */

function ActionItem({ item, index }) {
  // TODO: Implement action item UI
  
  return (
    <div className="action-item">
      <span className="checkbox">☐</span>
      <span className="action-text">{item}</span>
    </div>
  );
}

export default ActionItem;

