import React, { useState } from 'react';

const Register = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [passwordConfirmation, setPasswordConfirmation] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    
    const response = await fetch('http://localhost:3000/player_profiles', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ player_profile: { username, password, password_confirmation: passwordConfirmation } }),
    });

    if (response.ok) {
      console.log('Registration successful');
      // Redirect or show a success message
    } else {
      console.log('Registration failed');
      // Handle error response
    }
  };

  // JSX for the registration form
}
