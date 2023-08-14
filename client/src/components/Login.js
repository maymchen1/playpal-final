// Login.js
import React, { useState } from 'react';
import { useAuth } from '../AuthContext'; // Import the useAuth hook

function Login() {
  const { setUser } = useAuth();
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const handleLogin = () => {
    // Perform login logic
    setUser({ username }); // Set the user in the context
  };

  return (
    <div>
      <input type="text" placeholder="Username" onChange={(e) => setUsername(e.target.value)} />
      <input type="password" placeholder="Password" onChange={(e) => setPassword(e.target.value)} />
      <button onClick={handleLogin}>Login</button>
    </div>
  );
}

export default Login;
