import Cocoa

struct Album {
  let title: String
  let artist: String
  let year: Int

  func printSummary() {
    print("\(title) (\(year)) by \(artist)")
  }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings)

red.printSummary()
wings.printSummary()

struct Employee {
  let name: String
  var vacationAllocated = 14
  var vacationTaken = 0

  var vacationRemaining: Int {
    get {
      getVacationRemaining()
    }

    set {
      setVacationRemaining(to: newValue)
    }
  }

  func getVacationRemaining() -> Int {
    vacationAllocated - vacationTaken
  }

  mutating func setVacationRemaining(to value: Int) {
    vacationAllocated = vacationTaken + value
  }

  mutating func takeVacation(days: Int) {
    if vacationRemaining > days {
      vacationTaken += days
      print("I'm going on vacation!")
      print("Days remaining: \(vacationRemaining)")
    } else {
      print("Ooops! There aren't enough days remaining.")
    }
  }
}

// let archer = Employee(name: "Sterling Archer", vacationAllocated: 28) // ERROR
var archer = Employee(name: "Sterling Archer", vacationAllocated: 28)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)
archer.takeVacation(days: 30)
var archer2 = Employee.init(name: "Sterling Archer", vacationAllocated: 28)

let a = 1
let b = 2.0
let c = Double.init(a) + b
print(c)

let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationAllocated: 35)

print(archer.vacationTaken)
print(archer.vacationAllocated)
print(archer.vacationRemaining)

archer.vacationRemaining = 10
print(archer.vacationTaken)
print(archer.vacationAllocated)
print(archer.vacationRemaining)

struct Game {
  var score = 0 {
    willSet {
      print("Score is about to change from \(score) to \(newValue)")
    }

    didSet {
      print("Score has been changed from \(oldValue) to \(score)")
    }
  }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

print()

struct App {
  var contacts: [String] = [] {
    willSet {
      print("Current value is: \(contacts)")
      print("New value will be: \(newValue)")
    }

    didSet {
      print("There are now \(contacts.count) contacts.")
      print("Old value was \(oldValue)")
    }
  }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

struct Player {
  let name: String
  let number: Int

  init(name: String, number: Int) {
    self.name = name
    self.number = number
  }

  init(name: String) {
    self.name = name
    number = Int.random(in: 1...99)
  }
}

let player = Player(name: "Megan R")
print(player.number)

let player2 = Player(name: "Adrian", number: 12)
print(player2.number)

struct Employee2 {
  var name: String
  var yearsActive = 0
}

extension Employee2 {
  init() {
    self.name = "Anonymous"
    print("Creating an anonymous employee...")
  }
}

let anonymousEmployee = Employee2()
let roslin = Employee2(name: "Laura Roslin")
let adama = Employee2(name: "William Adama", yearsActive: 45)

struct Student {
  var name: String
  var bestFriend: String

  init(name studentName: String, bestFriend studentBestFriend: String) {
    print("Enrolling \(studentName) in class...")
    name = studentName
    bestFriend = studentBestFriend
  }
}

let student = Student(name: "Alex", bestFriend: "Bob")

struct Cabinet {
  var height: Double
  var width: Double
  var area: Double
  init (itemHeight: Double, itemWidth: Double) {
    height = itemHeight
    width = itemWidth
    area = height * width
  }
}
let drawers = Cabinet(itemHeight: 1.4, itemWidth: 1.0)
