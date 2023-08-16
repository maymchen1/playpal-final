import React from 'react';
import { Link } from 'react-router-dom';

function Home() {
  return (
    <div>
      <h1>Welcome to PlayPal!</h1>
      <Link to="/gamepostings">
        <button>Explore Game Postings</button>
      </Link>
      {/* Add more buttons and links as needed */}
    </div>
  );
}

export default Home;

