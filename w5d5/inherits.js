Function.prototype.inherits = function(SuperClass) {
  function Surrogate(){};
  Surrogate.prototype = SuperClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}

function MovingObject () {};

function Ship () {};
Ship.inherits(MovingObject);

function Asteroid () {};
Asteroid.inherits(MovingObject);

MovingObject.prototype.move = function() { console.log("move") }

let ship = new Ship()
console.log(ship.move());
