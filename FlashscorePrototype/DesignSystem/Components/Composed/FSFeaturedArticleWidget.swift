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
        .frame(height: 162)
    }

    private struct ArticleCard: View {
        let article: NewsArticle
        let onTap: () -> Void

        var body: some View {
            Button(action: onTap) {
                HStack(spacing: FSSpacing.xs16) {
                    // Image placeholder on left (3:2 aspect ratio)
                    ZStack(alignment: .topLeading) {
                        Color.greyA300
                            .aspectRatio(3/2, contentMode: .fit)
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
                    .frame(width: 120)

                    // Text content on right
                    VStack(alignment: .leading, spacing: FSSpacing.xxs8) {
                        Text(article.title)
                            .font(.bodyMBold)
                            .foregroundColor(.brandSlateBlack500)
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)

                        Text(article.perex)
                            .font(.labelMRegular)
                            .foregroundColor(.greyC500)
                            .lineLimit(2)
                            .truncationMode(.tail)
                            .multilineTextAlignment(.leading)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                }
                .padding(FSSpacing.xxs8)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
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
