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
            imageName: "NewsArticles/article-sports",
            perex: "England's iconic defender Lucy Bronze discusses her ambitions for the upcoming World Cup tournament and reflects on her legacy.",
            category: .womensWorldCup,
            isSponsored: true,
            isFeatured: true
        ),

        // Football news
        NewsArticle(
            title: "Lionel Messi scores stunning stoppage-time winner on Inter Miami debut",
            imageName: "NewsArticles/article-sports",
            perex: "In a dramatic debut, Messi secures victory with a late winner, capturing the hearts of Miami fans and making an instant impact.",
            category: .football
        ),

        NewsArticle(
            title: "Transfer News LIVE: Al-Nassr pouncing on Laporta, Neymar completes move to Al Hilal",
            imageName: "NewsArticles/article-sports",
            perex: "Premier League Round 15 summary: Top 3 teams and key moments from this week's action. City retains lead with convincing win.",
            category: .football
        ),

        NewsArticle(
            title: "Pogacar wins 20th stage of Tour de France but Vingegaard poised to claim title",
            imageName: "NewsArticles/article-sports",
            perex: "The cycling legend dominates another mountain stage, but questions remain about the final outcome of the grueling competition.",
            category: .all
        ),

        // Tennis news
        NewsArticle(
            title: "Djokovic defeats Alcaraz in thrilling Wimbledon final",
            imageName: "NewsArticles/article-sports",
            perex: "In a five-set epic at the All England Club, Djokovic claims another Grand Slam title in one of the tournament's best finals.",
            category: .tennis
        ),

        NewsArticle(
            title: "Williams sisters announce doubles return",
            imageName: "NewsArticles/article-sports",
            perex: "Tennis legends Venus and Serena Williams team up once more for a special exhibition tour, delighting fans worldwide.",
            category: .tennis
        ),

        // More football
        NewsArticle(
            title: "Manchester City complete treble with Champions League victory",
            imageName: "NewsArticles/article-sports",
            perex: "Pep Guardiola's Manchester City adds another trophy to their collection, cementing their place among Europe's elite.",
            category: .football
        ),

        NewsArticle(
            title: "Real Madrid sign Bellingham in record deal",
            imageName: "NewsArticles/article-sports",
            perex: "The Spanish giants secure one of the season's biggest transfers, bringing England's brightest talent to the Bernabéu.",
            category: .football
        ),

        NewsArticle(
            title: "Arsenal extend unbeaten run with north London derby victory",
            imageName: "NewsArticles/article-sports",
            perex: "Mikel Arteta's side remains unbeaten with a crucial derby win, putting pressure on Manchester City at the top.",
            category: .football
        ),

        NewsArticle(
            title: "Serena Williams confirms retirement after US Open",
            imageName: "NewsArticles/article-sports",
            perex: "The tennis icon announces her final tournament, marking the end of an era that transformed the sport forever.",
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
