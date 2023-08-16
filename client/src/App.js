import React from 'react';
import { Route, Switch} from 'react-router-dom';
import Home from './components/Home';
import GamePostings from './components/GamePostings';
import PlayerProfiles from './components/PlayerProfiles';
import Descriptions from './components/Descriptions'; 
import Friends from './components/Friends';
import Login from './components/Login';
import Register from './components/Register';

function App() {
  return (
    <Switch>
        <Route path="/" exact component={Home} />
        <Route path="/gamepostings" component={GamePostings} />
        <Route path="/playerprofiles" component={PlayerProfiles} />
        <Route path="/Descriptions" component={Descriptions} />
        <Route path="/Friends" component={Friends} />
        <Route path="/Login" component={Login} />
        <Route path="/Register" component={Register} />
        </Switch>
  );
}

export default App;