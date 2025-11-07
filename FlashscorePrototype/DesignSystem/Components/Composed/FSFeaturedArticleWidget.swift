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
        }
        .frame(height: 142)
    }

    private struct ArticleCard: View {
        let article: NewsArticle
        let onTap: () -> Void

        var body: some View {
            Button(action: onTap) {
                HStack(spacing: FSSpacing.xxs8) {
                    // Image placeholder on left (square)
                    ZStack(alignment: .topLeading) {
                        Color.greyA300
                            .frame(width: 75, height: 75)
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

                    // Text content on right
                    VStack(alignment: .leading, spacing: FSSpacing.xxxs4) {
                        Text(article.title)
                            .font(.labelMBold)
                            .foregroundColor(.brandSlateBlack500)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)

                        Text(article.perex)
                            .font(.labelSRegular)
                            .foregroundColor(.greyC500)
                            .lineLimit(2)
                            .truncationMode(.tail)
                            .multilineTextAlignment(.leading)
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                }
                .padding(.vertical, FSSpacing.xxs8)
                .padding(.horizontal, FSSpacing.xxs8)
                .padding(.leading, 0)
                .frame(height: 110)
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
