import Cocoa

protocol Vehicle {
  var name: String { get }
  var currentPassengers: Int { get set }
  func estimatedTime(for distance: Int) -> Int
  func travel(distance: Int)
}

struct Car: Vehicle {
  let name: String = "Car"
  var currentPassengers: Int = 2

  func estimatedTime(for distance: Int) -> Int {
    distance / 50
  }

  func travel(distance: Int) {
    print("I'm driving \(distance) km.")
  }

  func openSunroof() {
    print("It's a nice day!")
  }
}

struct Bicycle: Vehicle {
  let name: String = "Bicycle"
  var currentPassengers: Int = 1

  func estimatedTime(for distance: Int) -> Int {
    distance / 10
  }

  func travel(distance: Int) {
    print("I'm cycling \(distance) km.")
  }
}

struct Train {}

struct Bus {}

func commute(distance: Int, using vehicle: Vehicle) {
  if vehicle.estimatedTime(for: distance) > 100 {
    print("That's too slow! I'll try a different vehicle.")
  } else {
    vehicle.travel(distance: distance)
  }
}

func commute(distance: Int, using vehicle: Train) {
  // the code goes here
}

func commute(distance: Int, using vehicle: Bus) {
  // the code goes here
}

let car = Car()
commute(distance: 100, using: car)
let bike = Bicycle()
commute(distance: 50, using: bike)

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
  for vehicle in vehicles {
    let estimate = vehicle.estimatedTime(for: distance)
    print("\(vehicle.name): \(estimate) hours to travel \(distance) km.")
  }
}

getTravelEstimates(using: [car, bike], distance: 150)

protocol Purchaseable {
  var name: String { get set }
}

struct Book: Purchaseable {
  var name: String
  var author: String
}

struct Movie: Purchaseable {
  var name: String
  var actors: [String]
}

struct Car2: Purchaseable {
  var name: String
  var manufacturer: String
}

struct Coffee: Purchaseable {
  var name: String
  var strenght: Int
}

func buy(_ book: Purchaseable) {
  print("I'm buying \(book.name)")
}

buy(Book(name: "Harry Potter", author: "J.K. Rowling"))
buy(Coffee(name: "Arabica", strenght: 100))

func getRandomNumber() -> some Equatable {
  Double.random(in: 0.01...0.99)
  // Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
  Bool.random()
}

let randomNumber = getRandomNumber()
let randomBool = getRandomBool()
print(randomNumber)
print(randomBool)

let randomNumber1 = getRandomNumber()
let randomNumber2 = getRandomNumber()
print(randomNumber1)
print(randomNumber2)
print(randomNumber1 == randomNumber2)

protocol Shape {
  func draw() -> String
}

struct Triangle: Shape {
  var size: Int

  func draw() -> String {
    var result: [String] = []
    for length in 1...size {
      result.append(String(repeating: "*", count: length))
    }
    return result.joined(separator: "\n")
  }
}
let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())

struct FlippedShape<T: Shape>: Shape {
  var shape: T

  func draw() -> String {
    let lines = shape.draw().split(separator: "\n")
    return lines.reversed().joined(separator: "\n")
  }
}
let flippedTriangle = FlippedShape(shape: smallTriangle)
print(flippedTriangle.draw())

struct JoinedShape<T: Shape, U: Shape>: Shape {
  var top: T
  var bottom: U

  func draw() -> String {
    return top.draw() + "\n" + bottom.draw()
  }
}
let joinedTriangles = JoinedShape(top: flippedTriangle, bottom: smallTriangle)
print(joinedTriangles.draw())

struct Square: Shape {
  var size: Int

  func draw() -> String {
    let line = String(repeating: "*", count: size)
    let result = Array<String>(repeating: line, count: size)
    return result.joined(separator: "\n")
  }
}

func makeTrapezoid() -> some Shape {
  let top = Triangle(size: 4)
  let middle = Square(size: 4)
  let bottom = FlippedShape(shape: top)
  let trapezoid = JoinedShape(
    top: top,
    bottom: JoinedShape(top: middle, bottom: bottom)
  )
  return trapezoid
}
let trapezoid = makeTrapezoid()
print(trapezoid.draw())

func flip<T: Shape>(_ shape: T) -> some Shape {
  return FlippedShape(shape: shape)
}

func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
  JoinedShape(top: top, bottom: bottom)
}

let opaqueJoinedTriangles = join(flip(smallTriangle), smallTriangle)
print(opaqueJoinedTriangles.draw())

//func invalidFlip<T: Shape>(_ shape: T) -> some Shape {
//  if shape is Square {
//    return shape // ERROR
//  }
//
//  return FlippedShape(shape: shape) // ERROR
//}

var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

extension String {
  func trimmed() -> String {
    trimmingCharacters(in: .whitespacesAndNewlines)
  }

  mutating func trim() {
    self = self.trimmed()
  }

  var lines: [String] {
    components(separatedBy: .newlines)
  }
}

let trimmed2 = quote.trimmed()
print(trimmed)
print(trimmed2)

func trim(_ string: String) -> String {
  string.trimmingCharacters(in: .whitespacesAndNewlines)
}
let trimmed3 = trim(quote)
print(trimmed3)

print("\(quote).")
quote.trim()
print("\(quote).")

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines)

struct Book2 {
  let title: String
  let pageCount: Int
  let readingHours: Int
}

extension Book2 {
  init(title: String, pageCount: Int) {
    self.title = title
    self.pageCount = pageCount
    readingHours = pageCount / 50
  }
}

let lotr = Book2(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

let guests = ["Mario", "Luigi", "Peach"]
if guests.isEmpty == false {
  print("Guest count: \(guests.count)")
}

// extension Array {
extension Collection {
  var isNotEmpty: Bool {
    !isEmpty
  }
}

if guests.isNotEmpty {
  print("Guest count: \(guests.count)")
}

let userInfo: [String: Any] = ["name": "Taylor", "age": 25]
if userInfo.isNotEmpty {
  print("User info is filled.")
}

protocol Person {
  var name: String { get }
  func sayHello()
}

extension Person {
  func sayHello() {
    print("Hi, I'm \(name).")
  }
}

struct Employee: Person {
  let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

let numbers = [4, 8, 15, 16]
let allEven = numbers.allSatisfy { $0.isMultiple(of: 2) }
print(numbers)
print(allEven)

let numbers2 = Set([4, 8, 15, 16])
let allEven2 = numbers2.allSatisfy { $0.isMultiple(of: 2) }
print(numbers2)
print(allEven2)

let numbers3 = [4: "four", 8: "eight", 15: "fifteen", 16: "sixteen"]
let allEven3 = numbers3.allSatisfy { $0.key.isMultiple(of: 2) }
print(numbers3)
print(allEven3)

extension Sequence where Element == Int {
  func allEven() -> Bool {
    self.allSatisfy { $0.isMultiple(of: 2) }
  }
}

print(numbers.allEven())
print(numbers2.allEven())
// print(numbers3.allEven()) // ERROR

protocol Building {
  var rooms: Int { get }
  var cost: Int { get }
  var estateAgentName: String { get }
  func printSalesSummary()
}

extension Building {
  func printProperties() {
    print("Number of rooms: \(rooms)")
    print("Cost: $\(cost)")
    print("Estate agent: \(estateAgentName)")
  }
}

struct House: Building {
  let rooms: Int
  let cost: Int
  let estateAgentName: String

  func printSalesSummary() {
    print("A beautiful house")
    printProperties()
  }
}

struct Office: Building {
  let rooms: Int
  let cost: Int
  let estateAgentName: String

  func printSalesSummary() {
    print("Moder office")
    printProperties()
  }
}

let house = House(rooms: 4, cost: 100_000, estateAgentName: "Sarah")
let office = Office(rooms: 10, cost: 550_000, estateAgentName: "John")
house.printSalesSummary()
office.printSalesSummary()
