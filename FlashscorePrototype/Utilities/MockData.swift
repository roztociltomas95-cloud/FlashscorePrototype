//
//  MockData.swift
//  FlashscorePrototype
//
//  Utility: Realistic mock data for prototyping
//

import Foundation

struct MockData {

    // MARK: - Teams

    static let premierLeagueTeams = [
        "Arsenal", "Chelsea", "Liverpool", "Manchester City",
        "Manchester United", "Tottenham", "Newcastle", "Brighton"
    ]

    static let laLigaTeams = [
        "Real Madrid", "Barcelona", "Atlético Madrid", "Sevilla"
    ]

    static let bundesligaTeams = [
        "Bayern Munich", "Borussia Dortmund", "RB Leipzig", "Bayer Leverkusen"
    ]

    // MARK: - Match Status

    enum MatchStatus: String {
        case live = "LIVE"
        case finished = "FT"
        case halfTime = "HT"
        case scheduled = "18:00"
        case upcoming = "20:45"
    }

    // MARK: - Sample Scores

    static let liveScores = [
        (home: "Arsenal", away: "Chelsea", homeScore: 2, awayScore: 1, status: MatchStatus.live),
        (home: "Liverpool", away: "Manchester City", homeScore: 1, awayScore: 1, status: MatchStatus.live),
        (home: "Real Madrid", away: "Barcelona", homeScore: 3, awayScore: 2, status: MatchStatus.live)
    ]

    static let finishedMatches = [
        (home: "Manchester United", away: "Tottenham", homeScore: 2, awayScore: 0, status: MatchStatus.finished),
        (home: "Bayern Munich", away: "Borussia Dortmund", homeScore: 4, awayScore: 1, status: MatchStatus.finished)
    ]

    static let upcomingMatches = [
        (home: "Newcastle", away: "Brighton", status: MatchStatus.scheduled),
        (home: "Atlético Madrid", away: "Sevilla", status: MatchStatus.upcoming)
    ]
}
