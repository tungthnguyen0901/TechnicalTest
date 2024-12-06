import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';

class Timer {
  constructor() {
    this.time = 0;
    this.isRunning = false;
    this.timerId = null;
  }

  // Add callback for React
  start(callback) {
    if (this.isRunning) return;
    this.isRunning = true;

    const updateTime = () => {
      this.time++;
      if (callback) callback(this.time);

      this.timerId = setTimeout(updateTime, 1000);
    };

    updateTime();
  }

  pause() {
    if (!this.isRunning) return;
    this.isRunning = false;
    clearTimeout(this.timerId);
  }

  reset(callback) {
    if (this.isRunning) return;
    this.time = 0;
    if (callback) callback(this.time);
  }

  getTimer() {
    return this.time;
  }
}

const App = () => {
  const [timer] = useState(new Timer());
  const [rawTime, setRawTime] = useState(0);
  const [formattedTime, setFormattedTime] = useState("00:00:00");

  const formatTime = (seconds) => {
    const hrs = String(Math.floor(seconds / 3600)).padStart(2, "0");
    const mins = String(Math.floor((seconds % 3600) / 60)).padStart(2, "0");
    const secs = String(seconds % 60).padStart(2, "0");
    return `${hrs}:${mins}:${secs}`;
  };

  const updateTimer = (time) => {
    setRawTime(time);
    setFormattedTime(formatTime(time));
  };

  useEffect(() => {
    return () => timer.pause(); // Cleanup timer on unmount
  }, [timer]);

  return (
    <div className="App">

      <div style={{ textAlign: "center", }}>
        <h1>Timer</h1>
        <p>Raw Value: {rawTime}</p>
        <p>Clock Format: {formattedTime}</p>
        <div style={{ display: "flex", width:"200px",  justifyContent: "space-evenly", justifySelf: "center" }}>
          <button onClick={() => timer.start(updateTimer)}>Start</button>
          <button onClick={() => timer.pause()}>Pause</button>
          <button
            onClick={() => {
              timer.reset(updateTimer);
              setRawTime(0);
              setFormattedTime("00:00:00");
            }}
          >
            Reset
          </button>
        </div>
      </div>
    </div>
  );


};

export default App;
