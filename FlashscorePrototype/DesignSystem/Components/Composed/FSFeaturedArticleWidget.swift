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
            .padding(.vertical, FSSpacing.xs16)
            .frame(minHeight: 160)
        }
        .frame(height: 192)
    }

    private struct ArticleCard: View {
        let article: NewsArticle
        let onTap: () -> Void

        var body: some View {
            Button(action: onTap) {
                HStack(spacing: FSSpacing.xs16) {
                    // Image with label (left side)
                    ZStack(alignment: .topLeading) {
                        Image(article.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 128)
                            .clipped()
                            .cornerRadius(8)

                        // Hot badge
                        Text("Hot")
                            .font(.labelMBold)
                            .foregroundColor(.white)
                            .padding(.horizontal, FSSpacing.xxs8)
                            .padding(.vertical, FSSpacing.xxxs4)
                            .background(Color.brandRed500)
                            .cornerRadius(4)
                            .padding(FSSpacing.xxs8)
                    }

                    // Text content (right side)
                    VStack(alignment: .leading, spacing: FSSpacing.xxxs4) {
                        Text(article.title)
                            .font(.bodyMBold)
                            .foregroundColor(.brandSlateBlack500)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)

                        Text(article.perex)
                            .font(.labelMRegular)
                            .foregroundColor(.greyC500)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)

                        Spacer()
                    }
                }
                .padding(FSSpacing.xs16)
                .frame(width: 280, height: 160)
                .background(Color.white)
                .cornerRadius(8)
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
