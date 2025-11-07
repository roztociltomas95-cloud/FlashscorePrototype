//
//  MockNewsData.swift
//  FlashscorePrototype
//
//  Mock news articles for prototyping
//

import Foundation

struct MockNewsData {
    static let articles: [NewsArticle] = [
        // Featured article - Women's World Cup
        NewsArticle(
            title: "'We know how to win finals': England's Bronze targets World Cup gold",
            imageName: "Placeholders/Logo",
            category: .womensWorldCup,
            isSponsored: true,
            isFeatured: true
        ),

        // Football news
        NewsArticle(
            title: "Lionel Messi scores stunning stoppage-time winner on Inter Miami debut",
            imageName: "Placeholders/Logo",
            category: .football
        ),

        NewsArticle(
            title: "Transfer News LIVE: Al-Nassr pouncing on Laporta, Neymar completes move to Al Hilal",
            imageName: "Placeholders/Logo",
            category: .football
        ),

        NewsArticle(
            title: "Pogacar wins 20th stage of Tour de France but Vingegaard poised to claim title",
            imageName: "Placeholders/Logo",
            category: .all
        ),

        // Tennis news
        NewsArticle(
            title: "Djokovic defeats Alcaraz in thrilling Wimbledon final",
            imageName: "Placeholders/Logo",
            category: .tennis
        ),

        NewsArticle(
            title: "Williams sisters announce doubles return",
            imageName: "Placeholders/Logo",
            category: .tennis
        ),

        // More football
        NewsArticle(
            title: "Manchester City complete treble with Champions League victory",
            imageName: "Placeholders/Logo",
            category: .football
        ),

        NewsArticle(
            title: "Real Madrid sign Bellingham in record deal",
            imageName: "Placeholders/Logo",
            category: .football
        ),

        NewsArticle(
            title: "Arsenal extend unbeaten run with north London derby victory",
            imageName: "Placeholders/Logo",
            category: .football
        ),

        NewsArticle(
            title: "Serena Williams confirms retirement after US Open",
            imageName: "Placeholders/Logo",
            category: .tennis
        )
    ]

    static func articles(for category: NewsCategory) -> [NewsArticle] {
        if category == .all {
            return articles
        }
        return articles.filter { $0.category == category }
    }
}
