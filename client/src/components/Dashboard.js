import React, { useState, useEffect } from 'react';
import { useAuth } from '../AuthContext';

const Dashboard = () => {
  const { user, logout } = useAuth();
  const [friends, setFriends] = useState([]);
  const [gamePostings, setGamePostings] = useState([]);

  useEffect(() => {
    // Fetch friends data
    fetchFriends();

    // Fetch game postings data
    fetchGamePostings();
  }, []);

  const fetchFriends = async () => {
    try {
      const response = await fetch(`http://localhost:3000/player_profiles/${user.player_profile_id}/friends`);
      const data = await response.json();
      setFriends(data);
    } catch (error) {
      console.error('Error fetching friends:', error);
    }
  };

  const fetchGamePostings = async () => {
    try {
      const response = await fetch(`http://localhost:3000/player_profiles/${user.player_profile_id}/player_games`);
      const data = await response.json();
      setGamePostings(data);
    } catch (error) {
      console.error('Error fetching game postings:', error);
    }
  };

  return (
    <div>
      <h2>Dashboard</h2>
      <div>
        <h3>Friends List</h3>
        <ul>
          {friends.map((friend) => (
            <li key={friend.id}>
              {friend.friend.username} - {friend.invite_status}
            </li>
          ))}
        </ul>
      </div>
      <div>
        <h3>Your Game Postings</h3>
        <ul>
          {gamePostings.map((posting) => (
            <li key={posting.id}>
              {posting.game_posting.title} - {posting.game_posting.description_title}
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
};

export default Dashboard;
