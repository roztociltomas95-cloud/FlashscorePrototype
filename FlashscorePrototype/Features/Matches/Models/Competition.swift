//
//  Competition.swift
//  FlashscorePrototype
//
//  Model: Competition data structure
//

import Foundation

struct Competition: Identifiable {
    let id: UUID
    let logoName: String
    let name: String
    let country: String
    let matchCount: Int
    let hasAudio: Bool

    init(
        id: UUID = UUID(),
        logoName: String,
        name: String,
        country: String,
        matchCount: Int,
        hasAudio: Bool = false
    ) {
        self.id = id
        self.logoName = logoName
        self.name = name
        self.country = country
        self.matchCount = matchCount
        self.hasAudio = hasAudio
    }
}

// MARK: - Mock Data

struct MockCompetitionData {
    static let footballCompetitions: [Competition] = [
        Competition(
            logoName: "England",
            name: "Premier League",
            country: "ENGLAND",
            matchCount: 8
        ),
        Competition(
            logoName: "antiguaandbarbuda",
            name: "ABFA Premier League",
            country: "ANTIGUA & BARBUDA",
            matchCount: 1
        ),
        Competition(
            logoName: "Argentina",
            name: "Primera Nacional",
            country: "ARGENTINA",
            matchCount: 7,
            hasAudio: true
        ),
        Competition(
            logoName: "Argentina",
            name: "Primera C",
            country: "ARGENTINA",
            matchCount: 1
        ),
        Competition(
            logoName: "Armenia",
            name: "First League",
            country: "ARMENIA",
            matchCount: 4
        ),
        Competition(
            logoName: "aruba",
            name: "Division di Honor",
            country: "ARUBA",
            matchCount: 1
        ),
        Competition(
            logoName: "Australia",
            name: "World Championship",
            country: "AUSTRALIA & OCEANIA",
            matchCount: 1
        ),
        Competition(
            logoName: "barbados",
            name: "Premier League",
            country: "BARBADOS",
            matchCount: 1
        ),
        Competition(
            logoName: "Brazil",
            name: "Brasileiro Women",
            country: "BRAZIL",
            matchCount: 1
        ),
        Competition(
            logoName: "burkinafaso",
            name: "Premier League",
            country: "BURKINA FASO",
            matchCount: 7
        )
    ]
}
