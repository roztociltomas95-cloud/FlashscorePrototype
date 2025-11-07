//
//  Sport.swift
//  FlashscorePrototype
//
//  Model: Sport data structure
//

import Foundation

struct Sport: Identifiable {
    let id: UUID
    let name: String
    let iconName: String
    let liveCount: Int?
    let totalCount: Int
    let subtitle: String?
    let isPopular: Bool

    init(
        id: UUID = UUID(),
        name: String,
        iconName: String,
        liveCount: Int? = nil,
        totalCount: Int,
        subtitle: String? = nil,
        isPopular: Bool = false
    ) {
        self.id = id
        self.name = name
        self.iconName = iconName
        self.liveCount = liveCount
        self.totalCount = totalCount
        self.subtitle = subtitle
        self.isPopular = isPopular
    }
}
