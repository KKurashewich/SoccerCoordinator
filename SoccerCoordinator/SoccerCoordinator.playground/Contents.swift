

import UIKit

var str = "Hello, playground"
//: Playground - noun: a place where people can play



func main(){
    let teamNames:[String] = ["teamShark", "teamDragon", "teamRaptor"]
    
    let players:[ String: (withHeight: Int, withExperience: Bool, withParentsNamed: String)] = [
        "Joe Smith": (42, true, "Jim and Jan Smith"),
        "Jill Tanner": (36, true, "Clara Tanner"),
        "Bill Bon": (43, true, "Sara and Jenny Bon"),
        "Eva Gordon": (45, false, "Wendy and Mike Gordon"),
        "Matt Gill": (40, false, "Charles and Sylvia Gill"),
        "Kimmy Stein": (41 , false, "Bill and Hillary Stein"),
        "Sammy Adams": (45, false, "Jeff Adams"),
        "Karl Saygan": (42, true, "Heather Bledsoe"),
        "Suzane Greenberg": (44, true, "Henrietta Dumas"),
        "Sal Dali": (41, false, "Gala Dali"),
        "Joe Kavalier": (39, false, "Sam and Elaine Kavalier"),
        "Ben Finkelstein": (44, false, "Aaron and Jill Finkelstein"),
        "Diego Soto": (41, true, "Robin and Sarika Soto" ),
        "Chloe Alaska": (47, false, "David and Jamie Alaska"),
        "Arnold Willis": (43, false, "Claire Willis"),
        "Phillip Helm": (44, true, "Thomas Helm and Eva Jones"),
        "Les Clay": (42, true, "Wynonna Brown"),
        "Herschel Krustofski": ( 45, true, "Hyman and Rachel Krustofski")
    ]
    
    let namesByHeight:[String] = organizeTeamByHeight(playersInfo: players)
    
    let teams: [(teamName: String, playerName: String, parentName: String)] = organizeTeams(playersInfo: players, namesByHeight: namesByHeight, teamNames: teamNames)
    
    var letters: [String] = createMessagesForPlayers(teams: teams)
    
    displayMessagesToConsole(messages: letters)
    
    getAverageHeightForTeams(teams: teams, playerInfo: players)
    
    /////////////////////////// error with function /////////////////////////////
    //var teams: [String : [(playerName: String, parentName: String)]] = organizeTeams(playersInfo: players, namesByHeight: namesByHeight, teamNames: teamNames)
    
    //sendInformationToPlayers(teams: teams)
    
}

func organizeTeamByHeight(playersInfo players: [String: (withHeight: Int, withExperience: Bool, withParentsNamed: String)]) -> [String]{
    var names: [String] = [];
    var shortestHeight: Int = 0;
    
    while(names.count < players.count){
        for(player, info) in players{
            if(info.withHeight == shortestHeight){
                names.append(player);
            }
        }
        shortestHeight += 1;
    }
    return names;
}

func organizeTeams(playersInfo players: [String: (withHeight: Int, withExperience: Bool, withParentsNamed: String)], namesByHeight names: [String], teamNames: [String]) -> [(teamName: String, playerName: String, parentName: String)]{
    
    var teams: [(teamName: String, playerName: String, parentName: String)] = []
    var experiencedPlayerCount: Int = 0
    var inexperiencedPlayerCount: Int = teamNames.count - 1
    var tempTuple: (teamName: String, playerName: String, parentName: String)
    
    let amountOfTeams: Int = teamNames.count
    
    for name in names {
        if(players[name] != nil){
            type(of: players[name]!.withParentsNamed)
            if(players[name]!.withExperience){
                tempTuple = (teamName: teamNames[experiencedPlayerCount % amountOfTeams], playerName: name, parentName: players[name]!.withParentsNamed)
                teams.append(tempTuple)
                experiencedPlayerCount += 1;
            }else{
                tempTuple = (teamName: teamNames[inexperiencedPlayerCount % amountOfTeams], playerName: name, parentName: players[name]!.withParentsNamed)
                teams.append(tempTuple)
                inexperiencedPlayerCount += 1;
            }
        }else{
            print("name was not in playersInfo!: Error in organizeTeams()")
        }
    }
    return teams
}
/*****************************organize teams into a dictionary*******************
 * this did not seem to work if i had to guess why. when you try to store information into a dictionary containing array of tuples i dont believe the language allocates enough memory when using the .append() function for the tuples inside the array.
 or even more likely i dont understand this language yet and i dont have the training to allocate memory to do what i want im thinking. maybe after i learn about dynamic memory allocation in swift i will be able to make this function work
 *
 *
 */
/*
 func organizeTeams(playersInfo players: [String: (withHeight: Int, withExperience: Bool, withParentsNamed: String)], namesByHeight names: [String], teamNames: [String]) -> [String : [(playerName: String, parentName: String)]]{
 
 var teams: [String : [(playerName: String, parentName: String)]] = [:]
 var experiencedPlayerCount: Int = 0
 var inexperiencedPlayerCount: Int = 0
 var tempTuple: (playerName: String, parentName: String)
 
 let amountOfTeams: Int = teamNames.count
 
 for name in names {
 if(players[name] != nil){
 if(players[name]!.withExperience){
 if(teams[teamNames[experiencedPlayerCount % amountOfTeams]] == nil){
 teams[teamNames[experiencedPlayerCount % amountOfTeams]] = []
 }
 
 tempTuple = (playerName: name, parentName: players[name]!.withParentsNamed)
 teams[teamNames[experiencedPlayerCount % amountOfTeams]]!.append(tempTuple)
 experiencedPlayerCount += 1;
 }else{
 if(teams[teamNames[inexperiencedPlayerCount % amountOfTeams]] == nil){
 teams[teamNames[inexperiencedPlayerCount % amountOfTeams]] = []
 }
 
 tempTuple = (playerName: name, parentName: players[name]!.withParentsNamed)
 teams[teamNames[inexperiencedPlayerCount % amountOfTeams]]!.append(tempTuple)
 inexperiencedPlayerCount += 1;
 }
 }
 }
 return teams
 }
 */

func createMessagesForPlayers(teams: [(teamName: String, playerName: String, parentName: String)]) -> [String]{
    var messages: [String] = []
    var tempMessage: String
    for player in teams{
        tempMessage = ""
        tempMessage += "---------------------------------------------------------------------------------\n"
        tempMessage += "Congradulations \(player.parentName), \n"
        tempMessage += "\t Your soccer player \(player.playerName) is being recruited by \(player.teamName) \n"
        tempMessage += "To get this season kicked off, have him join up with us on: 11/8/2017 at 2:00pm.\n"
        tempMessage += "we are excited to see you then!!!\n"
        tempMessage += "---------------------------------------------------------------------------------\n"
        messages.append(tempMessage)
    }
    return messages
}

func displayMessagesToConsole(messages: [String]){
    for message in messages {
        print(message)
    }
}

func getAverageHeightForTeams(teams: [(teamName: String, playerName: String, parentName: String)], playerInfo:[ String: (withHeight: Int, withExperience: Bool, withParentsNamed: String)])-> [String: Double]{
    var teamInfo: [(teamName: String, teamPlayerCount: Int, totalTeamHeight: Double)] = []
    var teamAverageHeight: [String: Double] = [:]
    
    for team in teams{
        if(playerInfo[team.playerName] != nil){
            if(teamAverageHeight[team.teamName] == nil){
                teamAverageHeight[team.teamName] = Double(playerInfo[team.playerName]!.withHeight)
                teamInfo.append((team.teamName, 1, Double(playerInfo[team.playerName]!.withHeight)))
            }else{
                for index in 0..<teamInfo.count{
                    if(teamInfo[index].teamName == team.teamName){
                        teamInfo[index].teamPlayerCount += 1
                        teamInfo[index].totalTeamHeight += Double(playerInfo[team.playerName]!.withHeight)
                        teamAverageHeight[team.teamName] = teamInfo[index].totalTeamHeight / Double(teamInfo[index].teamPlayerCount)
                    }
                }
            }
        }else{
            print("player not in playerInfo: Error getAverageHeightForTeams()")
        }
    }
    return teamAverageHeight
}

main()




