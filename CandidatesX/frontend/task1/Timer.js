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
        console.log(this.time)
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


const timer = new Timer();
timer.start();
setTimeout(() => {
    timer.pause();
    console.log("Paused at:", timer.getTimer()); 
    timer.reset();
    console.log("Reset to:", timer.getTimer()); 
}, 5000);


