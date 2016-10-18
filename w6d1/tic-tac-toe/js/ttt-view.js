class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard()
    this.bindEvents()
  }

  bindEvents() {
    const $boxes = $("li");
    $boxes.on("click", event => {
      const currentTarget = event.currentTarget;
      const $currentTarget = $(currentTarget);
      $currentTarget.text(this.game.currentPlayer);
      this.game.playMove($currentTarget.data("pos"));
      this.makeMove($currentTarget)
    })
  }

  makeMove($square) {
    // $square.off("click");
    $square.off("mouseover");
    $square.off("mouseleave");
    $square.css("background-color", "white")
    if (this.game.winner()) {
      this.game.swapTurn()
      const $gridUl = $("ul");
      $gridUl.append(`<figcaption>You won, ${this.game.currentPlayer}</figcaption>`)
      const $boxes = $("li");
      $boxes.off()
    }
  }

  setupBoard() {
    const $gridUl = $("<ul class='board'></ul>");
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        const $boxLi = $("<li class='square'></li>");
        this.$el.append($gridUl.append($boxLi));
        $boxLi.data("pos", [i, j]);
      }
    }
    const $boxes = $("li");
    $boxes.on("mouseover", event => {
      const currentTarget = event.currentTarget;
      const $currentTarget = $(currentTarget);
      $currentTarget.css("background-color", "yellow");
    })
    $boxes.on("mouseleave", event => {
      const currentTarget = event.currentTarget;
      const $currentTarget = $(currentTarget);
      $currentTarget.css("background-color", "grey");
    })
  }
}

module.exports = View;
