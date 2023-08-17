import React from 'react';
import { Link } from 'react-router-dom';

function Home() {
  return (
    <div>
      <p> ପ(๑•ᴗ•๑)ଓ ♡</p>
        <Link to="/login">
        <ul></ul>
        <button>Login</button>
      </Link>
      <h1>Welcome to PlayPal!</h1>
      <Link to="/gamepostings">
        <ul></ul>
        <button>Explore Game Titles</button>
      </Link>
      <Link to="/descriptions">
        <ul></ul>
        <button>Explore Post Descriptions</button>
      </Link>
      <Link to="/playerprofiles">
        <ul></ul>
        <button>View Player Profiles</button>
      </Link>
      <Link to="/friends">
       <ul></ul>
        <button>Friend List</button>
      </Link>
      <Link to="/register">
       <ul></ul>
        No Account? Register
      </Link>    
      </div>
  );
}

export default Home;

