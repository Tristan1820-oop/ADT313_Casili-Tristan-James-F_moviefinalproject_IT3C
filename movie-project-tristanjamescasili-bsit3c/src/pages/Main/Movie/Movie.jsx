import { Outlet, useNavigate } from 'react-router-dom';
import { useButtonContext } from '../../../context/ButtonContext';
import { useUserContext } from '../../../context/UserContext';
import './Movie.css';

const Movie = () => {
  const navigate = useNavigate();
  const { isCreateMode, setIsCreateMode, title, setTitle } = useButtonContext();
  const { role, accessToken } = useUserContext();
  
  return (
    <>
      <div className="movie-header">
        <h1>{title}</h1>
        <div className="create-container">
         
        </div>
      </div>
      <Outlet />
    </>
  );
};

export default Movie;
