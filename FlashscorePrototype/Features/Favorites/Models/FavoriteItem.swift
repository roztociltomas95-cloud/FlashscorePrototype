//
//  FavoriteItem.swift
//  FlashscorePrototype
//
//  Favorite items - teams and matches
//

import Foundation

struct FavoriteTeam: Identifiable {
    let id: UUID
    let name: String
    let logoName: String
    let league: String

    init(
        id: UUID = UUID(),
        name: String,
        logoName: String,
        league: String
    ) {
        self.id = id
        self.name = name
        self.logoName = logoName
        self.league = league
    }
}

enum FavoriteCategory: String, CaseIterable {
    case teams = "TEAMS"
    case matches = "MATCHES"

    var displayName: String {
        return self.rawValue
    }
}
