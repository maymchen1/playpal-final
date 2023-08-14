import React from 'react';
import ReactDOM from 'react-dom';
import { AuthProvider } from './AuthContext';
import Home from './components/Home';
import GamePostings from './components/GamePostings';
import PlayerProfiles from './components/PlayerProfiles';
import Descriptions from './components/Descriptions'; 
import Friends from './components/Friends';
import Login from './components/Login'

// Import other components as needed

ReactDOM.render(
  <AuthProvider>
  <div>
      <Home/>
      <Login/>
      <GamePostings/>
      <PlayerProfiles/>
      <Descriptions/>
      <Friends/>
      </div>
      </AuthProvider>,
  document.getElementById('root')
);
