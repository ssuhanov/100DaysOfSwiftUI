import Cocoa

let opposites = [
  "Mario": "Wario",
  "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]
print(peachOpposite)

if let marioOpposite = opposites["Mario"] {
  print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil
if let unwrappedName = username {
  print("We got a user: \(unwrappedName)")
} else {
  print("The optional was empty.")
}

func square(number: Int) -> Int {
  number * number
}

var number: Int? = 4
// print(square(number: number)) // ERROR
// if let unwrappedNumber = number {
// if let number = number {
if let number {
  print(square(number: number))
  print(number)
}
print(number)

func getUsername() -> String? {
  "Taylor"
}

if let username = getUsername() {
  print("Username is \(username)")
} else {
  print("No username")
}

func printSquare(of number: Int?) {
  guard let number else {
    print("Missing input")
    return
  }

  print("\(number) x \(number) is \(number * number)")
}

printSquare(of: nil)
printSquare(of: 7)

func guardFlowTest(for myVar: Int?) {
  if let myVar {
    print("Run if myVar has a value inside")
  } else {
    print("Run if myVar doesn't have a value inside")
  }

  guard let myVar else {
    print("Run if myVar doesn't have a value inside")
    return
  }
  print("Run if myVar has a value inside")
}
guardFlowTest(for: nil)
guardFlowTest(for: 3)

func getMeaningOfLife() -> Int? {
  42
}

func printMeaningOfLife1() {
  if let name = getMeaningOfLife() {
    print(name)
  }
}

func printMeaningOfLife2() {
  guard let name = getMeaningOfLife() else {
    return
  }

  print(name)
}

printMeaningOfLife1()
printMeaningOfLife2()

let captains = [
  "Enterprise": "Picard",
  "Voyager": "Janeway",
  "Defiant": "Sisko"
]

// let new = captains["Serenity"] ?? "N/A"
let new = captains["Serenity", default: "N/A"]

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
  let title: String
  let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number2 = Int(input) ?? -1
print(number2)

func first() -> Int? {
  print("Running first")
  return 1
}

func second() -> Int? {
  print("Running second")
  return nil
}

let result2 = first() ?? second() ?? 3

let scores = ["Picard": 800, "Data": 7000, "Troi": 900]
let crusherScore = scores["Crusher"] ?? 0
let crusherScore2 = scores["Crusher", default: 0]

let names = ["Arya", "Bob", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

var bookToSort: Book? = nil
let authorFirstLetter = bookToSort?.author?.first?.uppercased() ?? "A"
print(authorFirstLetter)

let authorNames = ["Vincent": "van Gogh", "Pablo": "Picasso", "Claude": "Monet"]
let surnameLetter = authorNames["vVincent"]?.first?.uppercased() ?? "?"
print(surnameLetter)

enum UserError: Error {
  case badId
  case networkFailed
}

func getUser(id: Int) throws -> String {
  throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
  print("User: \(user)")
} else {
  print("No user")
}

let user = (try? getUser(id: 23))?.uppercased() ?? "No user"
print(user)

func runRiskyFunction1() throws {
  print("Running risky function 1")
  throw UserError.badId
}

func runRiskyFunction2() throws {
  print("Running risky function 2")
  throw UserError.networkFailed
}

do {
  try runRiskyFunction1()
  try runRiskyFunction2()
} catch {
  print("failure")
}

try? runRiskyFunction1()
try? runRiskyFunction2()

func randomNumber(from arrayOfIntegers: [Int]?) -> Int {
  arrayOfIntegers?.randomElement() ?? Int.random(in: 1...100)
}
print(randomNumber(from: nil))
print(randomNumber(from: []))
print(randomNumber(from: [-1, -2, -3]))
