import React, { useState, useEffect } from 'react';

function Descriptions() {
  const [descriptions, setDescriptions] = useState([]);

  useEffect(() => {
    // Fetch descriptions from Rails API
    fetch('http://localhost:3000/api/descriptions')
      .then(response => response.json())
      .then(data => setDescriptions(data))
      .catch(error => console.error(error));
  }, []);

  return (
    <div>
      <h2>Descriptions</h2>
      <ul>
        {descriptions.map(desc => (
          <li key={desc.id}>
            <h3>{desc.description_title}</h3>
            <p>{desc.description_text}</p>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default Descriptions;
