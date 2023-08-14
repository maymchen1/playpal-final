import React from 'react';
import ReactDOM from 'react-dom';
import { Route } from 'react-router-dom';
import { AuthProvider } from './Auth';
import Home from './components/Home';
import GamePostings from './components/GamePostings';
import PlayerProfiles from './components/PlayerProfiles';
import Descriptions from './components/Descriptions'; 
import Friends from './components/Friends';

// Import other components as needed

ReactDOM.render(
  <Auth>
  <div>
      <Home/>
      <GamePostings/>
      <PlayerProfiles/>
      <Descriptions/>
      <Friends/>
      </div>
      </Auth>,
  document.getElementById('root')
);
