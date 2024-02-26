import React, { useState, useEffect } from 'react';
import { fetchMessage } from '../services/api'; 
import './BackgroundImageWithText.css'; 

function BackgroundImageWithText() {
  const [message, setMessage] = useState('Loading message...');

  useEffect(() => {
    async function fetchData() {
      const messageData = await fetchMessage();
      if (messageData && messageData.message) {
        setMessage(messageData.message);
      } else {
        console.log('Unexpected response structure:', messageData);
        setMessage("Could not load message. Check the console for details.");
      }
    }
    
    fetchData().catch(error => {
      console.error('An error occurred while fetching data:', error);
      setMessage("Error fetching message. Check the console for details.");
    });
  }, []);

  return (
    <div className="message-container"> {}
      <h1>{message}</h1>
    </div>
  );  
}

export default BackgroundImageWithText;
