import React, { useEffect, useState } from "react";

function App() {
  const [users, setUsers] = useState([]);
  const [newUser, setNewUser] = useState("");

  useEffect(() => {
    fetchUsers();
  }, []);

  const fetchUsers = () => {
    fetch("http://localhost:8000/users")
      .then(res => res.json())
      .then(data => setUsers(data.users));
  };

  const handleAddUser = async () => {
    if (!newUser.trim()) return;
    await fetch("http://localhost:8000/users", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ name: newUser }),
    });
    setNewUser("");
    fetchUsers();
  };

  return (
    <div style={{ padding: "20px" }}>
      <h1>Users from MongoDB</h1>
      <input
        type="text"
        value={newUser}
        onChange={(e) => setNewUser(e.target.value)}
        placeholder="Enter name"
      />
      <button onClick={handleAddUser}>Add User</button>

      <ul>
        {users.map((user, i) => <li key={i}>{user.name}</li>)}
      </ul>
    </div>
  );
}

export default App;
