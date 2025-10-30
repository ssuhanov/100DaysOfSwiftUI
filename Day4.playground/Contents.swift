import Cocoa

let surname: String = "Lasso"
var score: Double = 0

let playerName: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
let isAuthenticated: Bool = true
var albums: [String] = ["Red", "Fearless", "Red"]
var user: [String: Any] = ["id": "@s_suhanov"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "To Kill a Mockingbird"])

var soda: [String] = ["Coke", "Pepsi", "7UP"]
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle {
  case light, dark, system
}

var style: UIStyle = .dark
style = .system

let username: String
username = "@s_suhanov"
print(username)
// username = "something_else" // ERROR

// let score: Int = "Zero" // ERROR

var percentage: Double = 99
print(percentage)

var name: String
// name = 2 // ERROR

let names = ["Eleanor", "Chidi", "Tahani", "Jianyu", "Michael", "Janet"]
var jNames: [String] = []

for name in names {
  if name.hasPrefix("J") {
    jNames.append(name)
  }
}

print(jNames)

print(albums)
print(albums.count)
let uniqueAlbums = Set(albums)
print(uniqueAlbums)
print(uniqueAlbums.count)
