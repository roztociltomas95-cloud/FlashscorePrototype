//
//  MockFavoritesData.swift
//  FlashscorePrototype
//
//  Mock favorites data for prototyping
//

import Foundation

struct MockFavoritesData {
    static let favoriteTeams: [FavoriteTeam] = [
        FavoriteTeam(
            name: "Arsenal",
            logoName: "Arsenal",
            league: "Premier League"
        ),
        FavoriteTeam(
            name: "Liverpool",
            logoName: "Liverpool",
            league: "Premier League"
        ),
        FavoriteTeam(
            name: "Man City",
            logoName: "Man city",
            league: "Premier League"
        ),
        FavoriteTeam(
            name: "Chelsea",
            logoName: "Chelsea",
            league: "Premier League"
        )
    ]
}
