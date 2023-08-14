import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Home from './components/Home';
import GamePostings from './components/GamePostings';
import PlayerProfiles from './components/PlayerProfiles';
import Descriptions from './components/Descriptions'; 
import Friends from './components/Friends';

// Import other components as needed

ReactDOM.render(
  <Router>
    <Switch>
      <Route path="/" exact component={Home} />
      <Route path="/gamepostings" component={GamePostings} />
      <Route path="/playerprofiles" component={PlayerProfiles} />
      <Route path="/descriptions" component={Descriptions} />
      <Route path="/friends" component={Friends} />
    </Switch>
  </Router>,
  document.getElementById('root')
);
