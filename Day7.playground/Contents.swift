import Cocoa

func showWelcome() {
  print("Welcome to my app!")
  print("By default This prints out a conversion")
  print("chart from centimeters to inches, but you")
  print("can also set a custom range if you want.")
}

showWelcome()

let number = 139
if number.isMultiple(of: 2) {
  print("Event")
} else {
  print("Odd")
}

let roll = Int.random(in: 1...20)
print(roll)

func printTimesTables(number: Int, end: Int) {
  for i in 1...end {
    print("\(i) x \(number) is \(i * number)")
  }
}
printTimesTables(number: 5, end: 20)
// printTimesTables(end: 20, number: 5) // ERROR

let root = sqrt(169)
print(root)

func rollDice() -> Int {
  let result = Int.random(in: 1...6)
  return result
}
let result = rollDice()
print(result)

func areLettersIdentical(string1: String, string2: String) -> Bool {
  string1.sorted() == string2.sorted()
}

print(areLettersIdentical(string1: "abc", string2: "cbca"))

func pythagoras(a: Double, b: Double) -> Double {
  sqrt(a * a + b * b)
}

print(pythagoras(a: 3, b: 4))

func greet(name: String) -> String {
  let response = if name == "Taylor Swift" {
    "Oh wow!"
  } else {
    "Hello, \(name)"
  }

  return response
}

print(greet(name: "Sergii"))
print(greet(name: "Taylor Swift"))

var name1 = "Sergi"
let something = if name1 == "Sergii" {
  "Hello, Sergii!"
} else {
  "Hello!"
}
print(something)

var name2 = "Taylor2"
let something2 = switch name2 {
  case "Taylor": "Hello, Taylor!"
  case "Sergii": "Hello, Sergii!"
  default: "Hello"
}
print(something2)

func isUppercase(string: String) -> Bool {
  string == string.uppercased()
}

print(isUppercase(string: "SOMETHING"))
print(isUppercase(string: "Something"))

func getUser() -> (firstName: String, lastName: String) {
  ("Taylor", "Swift")
}
//let user = getUser()
//let firstName = user.firstName
//let lastName = user.lastName
let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")

let (anotherFirstName, _) = getUser()
print("Name: \(anotherFirstName)")

func getUser2() -> (String, String) {
  ("Taylor", "Swift")
}
let user2 = getUser2()
print("Name: \(user2.0) \(user2.1)")

func rollDice(sides: Int, count: Int) -> [Int] {
  var rolls: [Int] = []

  for _ in 1...count {
    let roll = Int.random(in: 1...sides)
    rolls.append(roll)
  }

  return rolls
}
let rolls = rollDice(sides: 6, count: 4)
print(rolls)

let lyric = "I see a red door and I want it painted black"
print(lyric.hasPrefix("I see"))

func isUppercase2(_ string: String) -> Bool {
  string == string.uppercased()
}

let string = "HELLO, WORLD!"
print(isUppercase2(string))

func printTimeTables2(for number: Int) {
  for i in 1...12 {
    print("\(i) x \(number) is \(i * number)")
  }
}
printTimeTables2(for: 5)
