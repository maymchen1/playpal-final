import React, { useState, useEffect } from 'react';
import { useAuth } from '../AuthContext';

const Dashboard = () => {
  const { user, logout } = useAuth();
  const [friends, setFriends] = useState([]);
  const [gamePostings, setGamePostings] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (user) {
      console.log('User in Dashboard:', user);
      fetchFriends();
      fetchGamePostings();
    }
  }, [user]);

  const fetchFriends = async () => {
    try {
      console.log('Fetching friends...');
      const response = await fetch(`http://localhost:3000/player_profiles/${user.player_profile_id}/friends`);
      const data = await response.json();
      setFriends(data);
    } catch (error) {
      console.error('Error fetching friends:', error);
    } finally {
      setLoading(false); // Set loading to false after fetching data
    }
  };
  
  const fetchGamePostings = async () => {
    try {
      console.log('Fetching game postings...');
      const response = await fetch(`http://localhost:3000/player_profiles/${user.player_profile_id}/player_games`);
      const data = await response.json();
      setGamePostings(data);
    } catch (error) {
      console.error('Error fetching game postings:', error);
    } finally {
      setLoading(false); // Set loading to false after fetching data
    }
  };
  
  if (loading) {
    return <div>Loading...</div>; // Display loading message
  }

  if (!user) {
    return <div>Login required</div>; // Display login message
  }

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