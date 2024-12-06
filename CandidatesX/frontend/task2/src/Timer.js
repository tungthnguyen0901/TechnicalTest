class Timer {
    constructor() {
        this.time = 0; 
        this.isRunning = false; 
        this.timerId = null; 
    }

    start() {
        if (this.isRunning) return; 
        this.isRunning = true;

        const updateTime = () => {
            this.time++;
            this.timerId = setTimeout(updateTime, 1000); 
        };

        updateTime();
    }

    pause() {
        if (!this.isRunning) return; 
        this.isRunning = false;
        clearTimeout(this.timerId); 
    }

    reset() {
        if (this.isRunning) return; 
        this.time = 0; 
    }

    getTimer() {
        return this.time; 
    }
}


