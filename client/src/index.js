import React from 'react';
import ReactDOM from 'react-dom';
import { Route } from 'react-router-dom';
import Home from './components/Home';
import GamePostings from './components/GamePostings';
import PlayerProfiles from './components/PlayerProfiles';
import Descriptions from './components/Descriptions'; 
import Friends from './components/Friends';

// Import other components as needed

ReactDOM.render(
  <div>
      <Route path="/" exact component={Home} />
      <Route path="/gamepostings" component={GamePostings} />
      <Route path="/playerprofiles" component={PlayerProfiles} />
      <Route path="/descriptions" component={Descriptions} />
      <Route path="/friends" component={Friends} />
      </div>,
  document.getElementById('root')
);
