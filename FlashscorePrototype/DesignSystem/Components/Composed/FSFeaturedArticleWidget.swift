//
//  FSFeaturedArticleWidget.swift
//  FlashscorePrototype
//
//  Featured article widget - Horizontal card with image, title, and perex for hero content
//

import SwiftUI

struct FSFeaturedArticleWidget: View {
    let articles: [NewsArticle]
    let onArticleTap: (NewsArticle) -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: FSSpacing.xs16) {
                ForEach(articles) { article in
                    ArticleCard(article: article, onTap: {
                        onArticleTap(article)
                    })
                }
            }
            .padding(.horizontal, FSSpacing.xs16)
            .padding(.vertical, FSSpacing.xxs8)
            .frame(minHeight: 120)
        }
        .frame(height: 136)
    }

    private struct ArticleCard: View {
        let article: NewsArticle
        let onTap: () -> Void

        var body: some View {
            Button(action: onTap) {
                ZStack(alignment: .topLeading) {
                    // Background image
                    Image("NewsArticles/messi-goat")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()

                    // Dark overlay for better text readability
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .black.opacity(0.5)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )

                    VStack(alignment: .leading, spacing: 0) {
                        // Hot badge at top
                        HStack {
                            Text("Hot")
                                .font(.labelMBold)
                                .foregroundColor(.white)
                                .padding(.horizontal, FSSpacing.xxs8)
                                .padding(.vertical, FSSpacing.xxxs4)
                                .background(Color.brandRed500)
                                .cornerRadius(4)

                            Spacer()
                        }
                        .padding(FSSpacing.xs16)

                        Spacer()

                        // Text content at bottom
                        VStack(alignment: .leading, spacing: FSSpacing.xxxs4) {
                            Text(article.title)
                                .font(.bodyMBold)
                                .foregroundColor(.white)
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)

                            Text(article.perex)
                                .font(.labelMRegular)
                                .foregroundColor(.white)
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(FSSpacing.xs16)
                    }
                }
                .frame(width: 260, height: 120)
                .cornerRadius(8)
                .clipped()
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    let footballArticles = MockNewsData.articles.filter { $0.category == .football }.prefix(5)

    FSFeaturedArticleWidget(
        articles: Array(footballArticles),
        onArticleTap: { _ in }
    )
    .background(Color.greyA200)
}
