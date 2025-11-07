//
//  NewsArticle.swift
//  FlashscorePrototype
//
//  News article data model
//

import Foundation

struct NewsArticle: Identifiable {
    let id: UUID
    let title: String
    let imageName: String
    let category: NewsCategory
    let isSponsored: Bool
    let isFeatured: Bool

    init(
        id: UUID = UUID(),
        title: String,
        imageName: String,
        category: NewsCategory,
        isSponsored: Bool = false,
        isFeatured: Bool = false
    ) {
        self.id = id
        self.title = title
        self.imageName = imageName
        self.category = category
        self.isSponsored = isSponsored
        self.isFeatured = isFeatured
    }
}

enum NewsCategory: String, CaseIterable {
    case all = "ALL"
    case football = "FOOTBALL"
    case tennis = "TENNIS"
    case womensWorldCup = "WOMEN'S WORLD CUP"

    var displayName: String {
        return self.rawValue
    }
}
