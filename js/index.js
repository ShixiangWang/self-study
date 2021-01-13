// Variable
let name = "Shixiang"
console.log(name)

// Constant
const interestRate = 0.3
console.log(interestRate)

// Javascript has two catagories of types
// Types #1: Primitives/Value Types
// String, Number, Boolean, undefined, null
//
// Types #2: Reference Types
// Object, Array, Function

let Name = "Shixiang" // String Literal
let age = 30 // Number Literal
let isApproved = true // Boolean Literal
let firstName = undefined
let lastName = null

console.log(isApproved)
console.log(lastName)

// dynamic
console.log(typeof age)
age = "30"
console.log(age)
console.log(typeof age)

// Object
let person = {
    name: "Shixiang",
    age: 30
}

console.log(person)

// Dot notation.
console.log(person.name)
person.name = "Shixiang Wang"
console.log(person.name)

// Bracket notation.
person['name'] = 'Shixiang'
console.log(person['name'])

// Array
let selectedColors = ['red', 'blue']
console.log(selectedColors)
console.log(selectedColors[0])
selectedColors[4] = 'green'
console.log(selectedColors)
selectedColors[3] = 10
console.log(selectedColors)
console.log(selectedColors.length)

// Function
function greet(name) {
    console.log("Hello World!")
    console.log("Hello " + name)
}

greet("Shixiang")

function square(number) {
    return number * number
}

let number = square(2)
console.log(number)