import Cocoa

var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

print(beatles)

// temperatures.append("Chris") // ERROR

let firstBeatle = beatles[0]
let firstNumber = numbers[0]
// let notAllowed = firstBeatle + firstNumber // ERROR

var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)

print(scores[1])

// var albums = Array<String>()

//var albums = [String]()
//albums.append("Folklore")

var albums = ["Folklore"]
albums.append("Fearless")
albums.append("Red")

print(albums)
print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

let removedCharacter = characters.remove(at: 2)
print(removedCharacter)
print(characters.count)

characters.removeAll()
print(characters.count)

let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

let cities = ["London", "Tokyo", "Rome", "Kyiv"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

let songName = "Swift is fun"
print(songName.sorted())
print(songName.reversed())

var employee = ["Taylor Swift", "Singer", "Nashville"]
print("Name: \(employee[0])")
// employee.remove(at: 1)
print("Job title: \(employee[1])")
print("Location: \(employee[2])")

let employee2 = [
  "name": "Taylor Swift",
  "job": "Singer",
  "location": "Nashville"
]

print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])
print(employee2["password", default: "Unknown"])
print(employee2["status", default: "Unknown"])
print(employee2["manager", default: "Unknown"])

let hasGraduated = [
  "Eric": false,
  "Maeve": true,
  "Otis": false,
]
// print(hasGraduated["Eric", default: "Unknown"]) // ERROR

let olympics = [
  2012: "London",
  2016: "Rio de Janeiro",
  2021: "Tokyo"
]
print(olympics[2012, default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206
print(heights)

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
print(archEnemies)
archEnemies["Batman"] = "Penguin"
print(archEnemies)
print(archEnemies.count)

let result = [
  "english": 100,
  "french": 85,
  "geography": 75
]
let historyResult = result["history", default: 0]
print(historyResult)

let people = Set([
  "Denzel Washington",
  "Tom Cruise",
  "Nicolas Cage",
  "Samuel L Jackson",
  "Tom Cruise" // duplicate will be removed
])
print(people)
print(people.count)
print(people.sorted())

var people2 = Set<String>()
people2.insert("Denzel Washington")
people2.insert("Tom Cruise")
people2.insert("Nicolas Cage")
people2.insert("Samuel L Jackson")
print(people2.contains("Tom Cruise"))

var selected = "Monday"
selected = "Tuesday"
selected = "January"
selected = "Friday "

enum Weekday {
//  case monday
//  case tuesday
//  case wednesday
//  case thursday
//  case friday

  case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .tuesday
day = .friday
