import React, { useState, useEffect } from 'react';

function GamePostings() {
  const [gamePostings, setGamePostings] = useState([]);

  useEffect(() => {
    fetch('http://localhost:3000/game_postings')
      .then(response => response.json())
      .then(data => setGamePostings(data))
      .catch(error => console.error(error));
  }, []);

  return (
    <div>
      <button><p2>Game Postings</p2></button>
        {gamePostings.map(game_posting => (
          <li key={game_posting.id}>{game_posting.title}</li>
        ))}
    </div>
  );
}

export default GamePostings;