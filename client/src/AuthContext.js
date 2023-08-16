import React, { createContext, useContext, useState } from 'react';

// Create the AuthContext
export const AuthContext = createContext();

// AuthProvider component
export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null); // Initialize with null or user data

  // Authentication functions
  const login = async (username, password) => {
    const response = await fetch('http://localhost:3000/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ username, password }),
    });
  
    const responseData = await response.json();
  
    if (responseData.success) {
      setUser(responseData.userData); // Set user data here
      return true;
    }
    return false;
  };
  
  const logout = () => {
    setUser(null); // Clear user data
  };

  return (
    <AuthContext.Provider value={{ user, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

// Custom hook to use the AuthContext
export const useAuth = () => {
  return useContext(AuthContext);
};
