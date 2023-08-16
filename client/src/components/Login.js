import React, { useState } from 'react';
import { useAuth } from '../AuthContext';
import { useHistory } from 'react-router-dom';

const Login = () => {
  const { login } = useAuth();
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [loginError, setLoginError] = useState(false);
  const history = useHistory();

  const handleSubmit = async (e) => {
    e.preventDefault();

    const response = await fetch('http://localhost:3000/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ username, password }),
    });
    
    if (response.status === 200) {
      const responseData = await response.json();
      console.log('Response data:', responseData);

    console.log('Response status:', response.status);

      // Update AuthContext and redirect or show a success message
      const success = await login(username, password); // Use your login function from AuthContext
      if (success) {
        console.log('Login successful');
        history.push('/dashboard'); // Redirect to the dashboard page
      } else {
        console.log('Login failed');
        setLoginError(true); // Set the login error state
        // Handle login failure, show error message, etc.
      }
    } else {
      const errorData = await response.json();
      console.log('Login failed. Error data:', errorData);
      setLoginError(true);
      // Handle error response
    }
  };

  return (
    <div>
      <h2>Login</h2>
      {loginError && (
        <div>
          <p><b>Login failed. Please try again.</b></p>
        </div>
      )}
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Username"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
        />
        <input
          type="password"
          placeholder="Password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
        <button type="submit">Login</button>
      </form>
    </div>
  );
};

export default Login;