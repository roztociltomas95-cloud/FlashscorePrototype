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

    @State private var currentIndex = 0

    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: FSSpacing.xs16) {
                        ForEach(Array(articles.enumerated()), id: \.element.id) { index, article in
                            ArticleCard(article: article, onTap: {
                                onArticleTap(article)
                            })
                            .id(index)
                        }
                    }
                    .padding(.horizontal, FSSpacing.xs16)
                    .padding(.vertical, FSSpacing.xs16)
                }
                .frame(height: UIScreen.main.bounds.height / 3)
            }
        }
    }

    private struct ArticleCard: View {
        let article: NewsArticle
        let onTap: () -> Void

        var body: some View {
            Button(action: onTap) {
                HStack(spacing: FSSpacing.xs16) {
                    // Image with label
                    ZStack(alignment: .topLeading) {
                        Image(article.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 110, height: 110)
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

                    // Text content
                    VStack(alignment: .leading, spacing: FSSpacing.xxxs4) {
                        Text(article.title)
                            .font(.bodyMBold)
                            .foregroundColor(.brandSlateBlack500)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)

                        Text(article.perex)
                            .font(.bodyMRegular)
                            .foregroundColor(.greyC500)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)

                        Spacer()
                    }
                    .frame(maxHeight: 110, alignment: .topLeading)

                    Spacer()
                }
                .frame(height: 110)
                .padding(FSSpacing.xs16)
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
