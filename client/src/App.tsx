import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import HelloWorld from './hello_world/HelloWorld';
import Ping from './ping/Ping';
import './App.css';
import Signs from './signs/Signs';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <p>
          Cosmic Pairing
        </p>
      </header>
      <div>
        <BrowserRouter>
          <Routes>
            <Route path="/hello" element={<HelloWorld />} />
            <Route path="/ping" element={<Ping />} />
            <Route path="/signs" element={<Signs />} />
          </Routes>
        </BrowserRouter>
      </div>
    </div>
  );
}

export default App;
