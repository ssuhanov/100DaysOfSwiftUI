import Cocoa

func greetUser() {
  print("Hi there!")
}

greetUser()

var greetCopy: () -> Void = greetUser
greetCopy()

let sayHello = {
  print("Hello!")
}

sayHello()

let sayHelloWithName = { (name: String) -> String in
  "Hello \(name)!"
}

print(sayHelloWithName("Taylor"))

func getUserData(for id: Int) -> String {
  if id == 1989 {
    return "Taylor Swift"
  } else {
    return "Anonymous"
  }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
  if name1 == "Suzanne" {
    return true
  } else if name2 == "Suzanne" {
    return false
  }

  return name1 < name2
}
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

let captainFirstTeam2 = team.sorted(by: { (name1: String, name2: String) -> Bool in
  if name1 == "Suzanne" {
    return true
  } else if name2 == "Suzanne" {
    return false
  }

  return name1 < name2
})
print(captainFirstTeam2)

let captainFirstTeam3 = team.sorted {
  if $0 == "Piper" {
    return true
  } else if $1 == "Piper" {
    return false
  }

  return $0 < $1
}
print(captainFirstTeam3)

let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

func animate(duration: Double, animations: () -> Void) {
  print("Starting a \(duration) second animation...")
  sleep(2)
  animations()
}

animate(duration: 5, animations: {
  print("Fade out the image")
})

animate(duration: 3) {
  print("Fade out the image")
}

func greetUser2() {
  print("Hi there!")
}

greetUser2()

var greetCopy2: () -> Void = greetUser2
greetCopy2()

func makeArray(
  size: Int,
  using generator: () -> Int
) -> [Int] {
  var numbers: [Int] = []

  for _ in 0..<size {
    let newNumber = generator()
    numbers.append(newNumber)
  }

  return numbers
}

func generateNumber() -> Int {
  Int.random(in: 1...20)
}

let rolls = makeArray(size: 5) {
  Int.random(in: 1...20)
}
print(rolls)

let rolls2 = makeArray(size: 50, using: generateNumber)
print(rolls2)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
  print("About to start first work")
  first()
  print("About to start second work")
  second()
  print("About to start third work")
  third()
  print("Done!")
}

doImportantWork {
  print("This is the first work")
} second: {
  print("This is the second work")
} third: {
  print("This is the third work")
}

func doOtherWork(first: () -> Void, times: Int) {
  for _ in 1...times {
    print("About to start first work")
    first()
  }
}

doOtherWork(first: {
  print("This is the work!")
}, times: 2)

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let result = luckyNumbers
  .filter { !$0.isMultiple(of: 2) }
  .sorted()
  .map { "\($0) is a lucky number" }

result.forEach {
  print($0)
}
