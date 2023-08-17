import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom'; // Import Link component
import { useAuth } from '../AuthContext';

const Dashboard = () => {
  const { user, logout } = useAuth();
  const [friends, setFriends] = useState([]);
  const [gamePostings, setGamePostings] = useState([]);
  const [loading, setLoading] = useState(true);
  const [editedUsername, setEditedUsername] = useState(''); 

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
      const response = await fetch(`http://localhost:3000/player_profiles/${user.id}/friends`);
      const data = await response.json();
      setFriends(data);
      setEditedUsername(data.username);
      console.log(data);
    } catch (error) {
      console.error('Error fetching friends:', error);
    }
    
  };

  const fetchGamePostings = async () => {
    try {
      console.log('Fetching game postings...');
      const response = await fetch(`http://localhost:3000/player_profiles/${user.id}/player_games`);
      const data = await response.json();
      setGamePostings(data);
      setEditedUsername(data.username);
      console.log(data);
    } catch (error) {
      console.error('Error fetching game postings:', error);
    } finally {
      setLoading(false);
    }
  };

  const handleDeleteAccount = async () => {
    const response = await fetch(`http://localhost:3000/player_profiles/${user.id}`, {
      method: 'DELETE',
    });
  
    if (response.ok) {
      console.log('Account deleted successfully');
      alert('Account deleted successfully'); // Show an alert
    } else {
      console.log('Account deletion failed');
      // Handle error response
    }
  };

  const handleUsernameEdit = async () => {
    const response = await fetch(`http://localhost:3000/player_profiles/${user.id}`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        player_profile: {
          username: editedUsername,
        },
      }),
    });
    if (response.ok) {
        console.log('Username updated successfully');
        // Refresh friends and game postings
        fetchFriends();
        fetchGamePostings();
      } else {
        console.log('Username update failed');
        // Handle error response
      }
    };
  
  if (loading) {
    return <div>Loading...</div>;
  }

  return (
    <div>
      <h2>Dashboard</h2>

      {user ? (
        <>
          <div>
            <h3>Friends List</h3>
            <ul>
              {friends.map((friend) => (
                <li key={friend.id}>
                  {friend.id} - {friend.invite_status}
                </li>
              ))}
            </ul>
          </div>
          <div>
            <h3>Your Game Postings</h3>
            <ul>
              {Array.from(new Set(gamePostings.map(posting => posting.game_posting_id))).map((uniqueGamePostingId) => (
                <li key={uniqueGamePostingId}>
                  Game Posting: {uniqueGamePostingId}
                </li>
              ))}
            </ul>
          </div>
          <div><p>
            <input
              type="text"
              value={editedUsername}
              onChange={(e) => setEditedUsername(e.target.value)}
            />
            <button onClick={handleUsernameEdit}>Update Username</button></p>
          </div>
          <button onClick={logout}>Logout</button>
          <p></p>
          <button onClick={handleDeleteAccount}>DELETE ACCOUNT - THIS ACTION IS IRREVERSIBLE </button>

        </>
      ) : (
        <div>
            <p>⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣴⣦⣦⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣠⣾⡿⠛⠛⡉⣉⣉⡀⠀⢤⡉⢳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣀⣤⣾⡿⢋⣴⣖⡟⠛⢻⣿⣿⣽⣆⠙⢦⡙⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠖⠒⠻⠻⠶⣦⣄⠀
⠉⣿⢸⠁⣸⣥⣹⠧⡠⣾⣿⣿⣿⣿⣧⡈⢷⣼⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣾⣿⣿⣶⣦⣈⠈⠻⣤
⠀⢹⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡟⣫⠀⠙⣿⣿⣿⣿⣷⡄⣽
⠀⠀⠳⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣀⣿⣟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠀⠀⠀⠈⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⠭⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠒⡊⠙⠉⠉⠉⠓⠲⠤⡀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⠏
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠿⣦⣴⣿⣶⣶⠀⠠⠀⣰⣤⣿⣦⠀⠀⠀⠀⠉⠙⠛⠻⠛⠁⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢛⠃⢀⣄⠀⣿⡿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠊⠟⠋⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢦⣄⡀⠀⠀⢀⣀⣠⣴⡿⣿⣦⣀⠀⠀⠀⠀⢀⣴⠏⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠻⠿⠉⠉⠉⠉⠉⠑⠋⠙⠻⡢⢖⡯⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀</p>
        <p>Login required to view friends and personal postings.</p>
        <p><button><Link to="/login">Login</Link></button></p>
        <p><button><Link to="/">Browse</Link></button></p>
      </div>
      )}
    </div>
  );
};

export default Dashboard;
