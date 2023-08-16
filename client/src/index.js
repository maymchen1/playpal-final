import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router} from 'react-router-dom';
import { AuthProvider } from './AuthContext';
import App from './App';


// Import other components as needed

ReactDOM.render(
  <Router>
  <AuthProvider>
    <App/>
      </AuthProvider>
      </Router>,
  document.getElementById('root')
);
