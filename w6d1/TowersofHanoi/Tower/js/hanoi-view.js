class View {

  constructor(game, $rootEl) {
    this.game = game;
    this.$rootEl = $rootEl;
    this.setupTowers();
  }

  setupTowers() {
    for (let i = 0; i < 3; i++) {
      this.$rootEl.append($("<ul></ul>"));
    }

    const $towers = $("ul");

    for (let i = 1; i < 4; i++) {
      const $disc = $('<li></li>');
      $disc.addClass(`disc-${i}`);
      $($towers[0]).append($disc);
    }

  }
























}


module.exports = View;
