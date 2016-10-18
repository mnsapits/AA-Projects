function sum(...args) {
  let sum = 0;
  args.forEach( (arg) => { sum += arg });
  console.log(sum);
}

Function.prototype.myBind = function (context) {
  return () => this.apply(context);
}

Function.prototype.myBind = function (context, ...args) {
    return (...args2) => this.apply(context, args.concat(args2));
}

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true
//
// markov.says.myBind(breakfast, "meow", "Kush")();
// // Breakfast says meow to Kush!
// // true
//
// markov.says.myBind(breakfast)("meow", "a tree");
// // Breakfast says meow to a tree!
// // true
//
// markov.says.myBind(breakfast, "meow")("Markov");
// // Breakfast says meow to Markov!
// // true
//
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");
// // Breakfast says meow to me!
// // true

function curriedSum(numArgs) {
  let numbers = [];
  let sum = 0;
  function _curriedSum(number) {
    numbers.push(number);
    if (numArgs === numbers.length) {
      numbers.forEach(num => { sum += num });
      return sum
    } else {
      return _curriedSum
    }
  }
  return _curriedSum
}

const sums = curriedSum(4);
// console.log(sums);
// console.log(sums(5)(30)(20)(1));



// Function.prototype.curry = function(numArgs) {
//   let numbers = [];
//   let that = this
//   function _curry(number) {
//     numbers.push(number)
//     if (numArgs === numbers.length) {
//       return that.apply(that, numbers)
//     } else {
//       return _curry
//     }
//   }
//
//   return _curry
// }

Function.prototype.curry = function(numArgs) {
  let numbers = [];
  let that = this;
  function _curry(number) {
    numbers.push(number)
    if (numArgs === numbers.length) {
      return that(...numbers)
    } else {
      return _curry
    }
  }

  return _curry
}

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30

// or more briefly:
console.log(sumThree.curry(3)(4)(20)(6));
