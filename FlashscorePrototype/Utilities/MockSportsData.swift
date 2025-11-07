//
//  MockSportsData.swift
//  FlashscorePrototype
//
//  Mock sports data for sport picker
//

import Foundation

struct MockSportsData {
    static let popularSports: [Sport] = [
        Sport(
            name: "Hockey",
            iconName: "sport-ice-hockey",
            liveCount: 8,
            totalCount: 10,
            isPopular: true
        ),
        Sport(
            name: "Tennis",
            iconName: "sport-tennis",
            liveCount: 4,
            totalCount: 149,
            isPopular: true
        ),
        Sport(
            name: "Basketball",
            iconName: "sport-basketball",
            totalCount: 21,
            isPopular: true
        ),
        Sport(
            name: "Handball",
            iconName: "sport-handball",
            totalCount: 9,
            isPopular: true
        ),
        Sport(
            name: "Baseball",
            iconName: "sport-baseball",
            totalCount: 13,
            isPopular: true
        ),
        Sport(
            name: "Winter sports",
            iconName: "sport-winter-sports",
            totalCount: 0,
            subtitle: "ALPINE, CROSS-COUNTRY,...",
            isPopular: true
        ),
        Sport(
            name: "Golf",
            iconName: "sport-golf",
            totalCount: 0,
            isPopular: true
        ),
        Sport(
            name: "Pesäpallo",
            iconName: "sport-pesapallo",
            totalCount: 1,
            isPopular: true
        ),
        Sport(
            name: "Football",
            iconName: "sport-soccer",
            totalCount: 153,
            isPopular: true
        ),
        Sport(
            name: "Am. football",
            iconName: "sport-american-football",
            totalCount: 3,
            isPopular: true
        )
    ]

    static let otherSports: [Sport] = [
        Sport(
            name: "Aussie rules",
            iconName: "sport-aussie-rules",
            totalCount: 3
        ),
        Sport(
            name: "Badminton",
            iconName: "sport-badminton",
            totalCount: 0
        ),
        Sport(
            name: "Bandy",
            iconName: "sport-bandy",
            totalCount: 0
        ),
        Sport(
            name: "Beach soccer",
            iconName: "sport-beach-football",
            totalCount: 0
        ),
        Sport(
            name: "Beach volleyball",
            iconName: "sport-beach-volleyball",
            totalCount: 0
        )
    ]

    static var allSports: [Sport] {
        popularSports + otherSports
    }
}
