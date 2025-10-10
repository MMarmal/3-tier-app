import React, { useEffect, useState } from "react";

function App() {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    fetch("http://localhost:8000/users")
      .then(res => res.json())
      .then(data => setUsers(data.users));
  }, []);

  return (
    <div>
      <h1>Users from MongoDB</h1>
      <ul>
        {users.map((user, i) => <li key={i}>{user.name}</li>)}
      </ul>
    </div>
  );
}

export default App;
