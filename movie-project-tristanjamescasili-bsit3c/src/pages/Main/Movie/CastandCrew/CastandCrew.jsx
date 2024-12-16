import React, { useState, useEffect} from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';
import './CastandCrew.css';
import { useUserContext } from '../../../../context/UserContext';

//variables and api key
const CastandCrew = () => {
  const { movieId } = useParams();
  const { userId, accessToken } = useUserContext();
  const [media, setMedia] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [isEditing, setIsEditing] = useState(false);
  const [imageUrl, setImageUrl] = useState('');
  const [imagePreview, setImagePreview] = useState('');
  const [nameText, setNameText] = useState('');
  const [characterName, setcharacterName] = useState('');
  const [currentMediaId, setCurrentMediaId] = useState(null);

  const tmdbApiKey = '497329e67f904395b79592a3c245314b';

  // Fetch media items from the database
  const loadMedia = async () => {
    setIsLoading(true);
    try {
      const response = await axios.get(`/media/${movieId}`, {
        headers: {
          'Authorization': `Bearer ${accessToken}`,
          'Accept': 'application/json'
        },
      });
      if (response.data) {
        setMedia(response.data);
      } else {
        console.error('Invalid response structure for media data.');
      }
    } catch (error) {
      console.error('Error fetching media:', error);
    } finally {
      setIsLoading(false);
    }
  };

  // Import images from TMDb
  const importImages = async () => {
    const tmdbUrl = `https://api.themoviedb.org/3/movie/${movieId}/images?api_key=${tmdbApiKey}`;

    if (!window.confirm('Confirm importing images from TMDb?')) {
      return;
    }

    try {
      setIsLoading(true);
      const { data } = await axios.get(tmdbUrl);
      const images = data.posters || [];

      if (!images.length) {
        alert('No images available for this movie on TMDb.');
        return;
      }

      const formattedImages = images.map((img) => ({
        movieId,
        userId,
        url: `https://image.tmdb.org/t/p/w500${img.file_path}`,
        description: img.description || 'No description available',
      }));

      await Promise.all(
        formattedImages.map((image) =>
          axios.post('/media', image, {
            headers: {
              'Content-Type': 'application/json',
              'Authorization': `Bearer ${accessToken}`,
            },
          })
        )
      );

      alert('Images imported successfully.');
      loadMedia();
    } catch (error) {
      console.error('Error importing images:', error);
      alert('Failed to import images from TMDb.');
    } finally {
      setIsLoading(false);
    }
  };

  // Submit form data for adding or editing media
  const handleFormSubmit = async (e) => {
    e.preventDefault();
    if (imageUrl && characterName) {
      const mediaData = { userId, movieId, nameText, url: imageUrl, characterName };

      try {
        const endpoint = isEditing ? `/media/${currentMediaId}` : '/media';
        const method = isEditing ? 'patch' : 'post';
        const response = await axios({
          method,
          url: endpoint,
          data: mediaData,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${accessToken}`,
          },
        });

        alert(isEditing ? 'Media updated successfully.' : 'New media added successfully.');
        loadMedia();
        resetForm();
      } catch (error) {
        console.error('Error saving media:', error);
        alert('Error saving media. Please try again.');
      }
    }
  };

  // Edit media item
  const editMedia = (id) => {
    const mediaToEdit = media.find((item) => item.id === id);
    if (mediaToEdit) {
      setCurrentMediaId(id);
      setImageUrl(mediaToEdit.url);
      setcharacterName(mediaToEdit.characteName);
      setIsEditing(true);
    }
  };

  // Delete media item
  const deleteMedia = async () => {
    if (currentMediaId) {
      try {
        await axios.delete(`/admin/media/${currentMediaId}`, {
          headers: {
            'Authorization': `Bearer ${accessToken}`,
          },
        });
        alert('Media deleted successfully.');
        loadMedia();
        resetForm();
      } catch (error) {
        console.error('Error deleting media:', error);
        alert('Error deleting media. Please try again.');
      }
    }
  };

  // Form reset function
  const resetForm = () => {
    setCurrentMediaId(null);
    setNameText('');
    setcharacterName('');
    setImageUrl('');
  };

  // Use effect to load media on component mount
  useEffect(() => {
    if (movieId) {
      loadMedia();
    }
  }, [movieId]);

  // Handle image preview updates
  useEffect(() => {
    if (imageUrl) {
      setImagePreview(imageUrl.startsWith('http') ? imageUrl : URL.createObjectURL(imageUrl));
    }
  }, [imageUrl]);

  return (
    <div className="media-management">
      <h1>Cast and Crew</h1>
      <div className="media-container">
        {isLoading && <p>Loading...</p>}
        <div className="media-table-container">
          {media.length > 0 ? (
            <table className="media-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Description</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                {media.map((item) => (
                  <tr key={item.id}>
                    <td>{item.id}</td>
                    <td>{item.description}</td>
                    <td>
                      <button onClick={() => editMedia(item.id)}>Edit</button>
                      <button onClick={deleteMedia}>Delete</button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          ) : (
            <p>

            </p>
          )}
        </div>
        <div className="media-form-container">
          <h2>{isEditing ? 'Edit castandcrew' : 'Add CastandCrew'}</h2>
          <form onSubmit={handleFormSubmit} className="media-form">
            <div className="preview-container">
              <label>Image Preview:</label>
              <img
                src={imagePreview || 'https://via.placeholder.com/200x300?text=No+Image'}
                alt="Preview"
                className="preview-image"
              />
            </div>
            <div className="form-field">
              <label>Name:</label>
              <input
                type="text"
                value={nameText}
                onChange={(e) => setNameText(e.target.value)}
                placeholder="Enter name"
                required
              />
            </div>
            <div className="form-field">
              <label>Character Name:</label>
              <input
                type="text"
                value={characterName}
                onChange={(e) => setcharacterName(e.target.value)}
                placeholder="Enter caharactername"
                required
              />
            </div>
            <div className="form-field">
              <label>Image URL:</label>
              <input
                type="text"
                value={imageUrl}
                onChange={(e) => setImageUrl(e.target.value)}
                placeholder="Enter image URL"
                required
              />
            </div>
            <div className="form-buttons">
              <button type="submit">{isEditing ? 'Update Media' : 'Add Media'}</button>
              {isEditing && <button type="button" onClick={resetForm}>Cancel</button>}
            </div>
          </form>
        </div>
      </div>
    </div>
  );
};

export default CastandCrew;
