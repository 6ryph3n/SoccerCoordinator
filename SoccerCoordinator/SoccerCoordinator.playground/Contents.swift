// Dictionary contains all information for each player and variables are named to be easily understood
var players: [String: (heightInInches: Int, hasExperience: Bool, parentNames: String, team: String)] = [
    "Joe Smith": (42, true, "Jim and Jan Smith", "none"),
    "Jill Tanner": (36, true, "Clara Tanner", "none"),
    "Bill Bon": (43, true, "Sara and Jenny Bon", "none"),
    "Eva Gordon": (45, false, "Wendy and Mike Gordon", "none"),
    "Matt Gill": (40, false, "Charles and Sylvia Gill", "none"),
    "Kimmy Stein": (41, false, "Bill and Hillary Stein", "none"),
    "Sammy Adams": (45, false, "Jeff Adams", "none"),
    "Karl Saygan": (42, true, "Heather Bledsoe", "none"),
    "Suzane Greenberg": (44, true, "Henrietta Dumas", "none"),
    "Sal Dall": (41, false, "Gala Dall", "none"),
    "Joe Kavalier": (39, false, "Sam and Elaine Kavalier", "none"),
    "Bill Finelstein": (44, false, "Aaron and Jill Finkelstein", "none"),
    "Diego Soto": (41, true, "Robin and Sarika Soto", "none"),
    "Chloe Alaska": (47, false, "David and Jamie Alaska", "none"),
    "Arnold Willis": (43, false, "Claire Willis", "none"),
    "Phillip Helm": (44, true, "Thomas Helm and Eva Jones", "none"),
    "Les Clay": (42, true, "Wyonna Brown", "none"),
    "Herschel Kristofski": (45, true, "Hyman and Rachel Krustofski", "none")
]

players["Joe Smith"]?.team

// Separate experienced and inexperienced players into distinct arrays
var experiencedPlayers: [String] = []
var inexperiencedPlayers: [String] = []

// Players names are appended to the appropriate array based on their experience
for player in players {
    if player.value.hasExperience == true {
        experiencedPlayers.append(player.key)
    } else {
        inexperiencedPlayers.append(player.key)
    }
    }

experiencedPlayers
inexperiencedPlayers

// Create the team arrays for the players to be divided into
var teamSharks: [String] = []
var teamDragons: [String] = []
var teamRaptors: [String] = []
var experienceGrouping: [String] = []
func dividePlayers(experienced: Bool) {
    if (experienced == true) {
        experienceGrouping = (experiencedPlayers)
    } else {
        experienceGrouping = (inexperiencedPlayers)
    }
    
let playersCount = experienceGrouping.count // Create an index of the experienced players

// Divide the experienced players evenly by using the modulo operator on each player's index number
for playerIndex in (0...(playersCount - 1)) {
    let currentPlayerName = experienceGrouping[playerIndex]
    
    if (playerIndex % 3 == 0) {
        teamSharks.append(currentPlayerName)
        players[currentPlayerName]?.team = "Sharks" // Update the value of "team" in the "players" dictionary
    } else if (playerIndex % 3 == 1) {
        teamDragons.append(currentPlayerName)
        players[currentPlayerName]?.team = "Dragons" // Update the value of "team" in the "players" dictionary
    } else if (playerIndex % 3 == 2) {
        teamRaptors.append(currentPlayerName)
        players[currentPlayerName]?.team = "Raptors" // Update the value of "team" in the "players" dictionary
    }
}

}

dividePlayers(experienced: true)
dividePlayers(experienced: false)

teamSharks
teamDragons
teamRaptors



// Specify the first practice time for each team

let teamPractices: [String: String] = [
    "Sharks": "March 17 at 3PM",
    "Dragons": "March 17 at 1PM",
    "Raptors": "March 18 at 1PM"
]

// Write a letter to the parents with all of their personal information
for child in players {
    var letters: [String] = []
    letters.append("Dear \(players[child.key]!.parentNames), we are excited to welcome \(child.key) to the \(players[child.key]!.team)! Your first practice will be \(teamPractices["\(players[child.key]!.team)"]!).")
    
    print(letters)
}
