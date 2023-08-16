import React, { useState, useEffect } from 'react';

function PlayerProfiles() {
  const [playerProfiles, setPlayerProfiles] = useState([]);

  useEffect(() => {
    // Fetch player profiles from Rails API
    fetch('http://localhost:3000/player_profiles')
      .then(response => response.json())
      .then(data => setPlayerProfiles(data))
      .catch(error => console.error(error));
  }, []);

  return (
    <div>
      <h2>Player Profiles</h2>
      <ul>
        {playerProfiles.map(profile => (
          <li key={profile.id}>{profile.username}</li>
        ))}
      </ul>
    </div>
  );
}

export default PlayerProfiles;
