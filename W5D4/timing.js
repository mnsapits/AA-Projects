class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    const time = new Date();
    this.hours = time.getHours();
    this.minutes = time.getMinutes();
    this.seconds = time.getSeconds();

    this.printTime();
    console.log(this);
    setInterval(this._tick.bind(this), 1000)
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    const timeString = `${this.hours}:${this.minutes}:${this.seconds}`;
    console.log(timeString);
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.seconds++;
    if (this.seconds > 59) {
      this.seconds = 0;
      this.minutes++;
    }

    if (this.minutes > 59) {
      this.minutes = 0;
      this.hours++;
    }

    if (this.hours > 23) {
      this.hours = 0;
    }
    this.printTime();
  }


}

const clock = new Clock();
