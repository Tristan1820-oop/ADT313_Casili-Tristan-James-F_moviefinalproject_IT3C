import React, { useState } from 'react';
import './Videos.css';

const Videos = () => {
  const [title, setTitle] = useState('');
  const [url, setUrl] = useState('');
  const [videos, setVideos] = useState([]);

  const handleAddVideo = () => {
    if (title && url) {
      // Validate if the URL is from a trusted source (e.g., YouTube)
      if (url.includes('youtube.com') || url.includes('youtu.be')) {
        setVideos([...videos, { title, url }]);
        setTitle('');
        setUrl('');
      } else {
        alert('Only YouTube URLs are allowed');
      }
    } else {
      alert('Please fill in both fields');
    }
  };

  return (
    <div>
      <h2>Videos</h2>
      <div>
        <label>Video Title:</label>
        <input
          type="text"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
          placeholder="Enter video title"
        />
      </div>
      <div>
        <label>Video URL:</label>
        <input
          type="url"
          value={url}
          onChange={(e) => setUrl(e.target.value)}
          placeholder="Enter video URL"
        />
      </div>
      <button onClick={handleAddVideo}>Add Video</button>

      <h3>Video List</h3>
      <ul>
        {videos.map((video, index) => (
          <li key={index}>
            <strong>Title:</strong> {video.title}
            <div>
              {/* Embed the video if it is a YouTube URL */}
              {video.url.includes('youtube.com') || video.url.includes('youtu.be') ? (
                <iframe
                  width="560"
                  height="315"
                  src={`https://www.youtube.com/embed/${video.url.split('v=')[1]?.split('&')[0]}`}
                  title={video.title}
                  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                  allowFullScreen
                ></iframe>
              ) : (
                <a href={video.url} target="_blank" rel="noopener noreferrer">
                  {video.url}
                </a>
              )}
            </div>
            <button onClick={() => window.open(video.url, '_blank')}>Watch</button>
          </li>
        ))}
      </ul>
    </div>
  );
  const tmdbApiKey = "497329e67f904395b79592a3c245314b"; 
};

export default Videos;
