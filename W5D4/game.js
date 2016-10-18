const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor() {
    this.towers = [[3,2,1],[],[]]
  }

  promptMove(callback) {
    // console.log(this.towers);
    reader.question(`Enter starting tower `, (start) => {
      const startTowerIdx = parseInt(start);
      reader.question(`Enter end tower `, (end) => {
        const endTowerIdx = parseInt(end);
        if (callback(startTowerIdx, endTowerIdx)) {

        }
      })
    })
  }

  isValidMove(startTowerIdx, endTowerIdx) {
    const startTower = this.towers[startTowerIdx];
    const endTower = this.towers[endTowerIdx];
    if (startTower.length === 0) {
      return false;
    } else if (endTower.length === 0) {
      return true;
    } else {
      const startTop = startTower[startTower.length - 1];
      const endTop = endTower[endTower.length - 1];
      return startTop < endTop;
    }
  }

  move(startTowerIdx, endTowerIdx) {
    this.isValidMove(startTowerIdx, endTowerIdx)
  }

  run(completionCallback) {
    if is_won() {
      completionCallback();
    } else {
      if this.promptMove(move) {
        run
      } else {
        console.log("Invalid move")
      }
    }

  }
}

g = new Game

g.isValidMove(0, 1);
console.log(g.isValidMove(0, 1));
