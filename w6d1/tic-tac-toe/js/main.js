const View = require('./ttt-view.js')
const Game = require('/Users/appacademy/Desktop/w6d1/solution/game.js')

$( () => {
  let $el = $(".ttt")
  let game = new Game();
  let view = new View(game, $el);
});
