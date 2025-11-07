//
//  NewsTabView.swift
//  FlashscorePrototype
//
//  Feature: News tab - Latest sports news and articles
//

import SwiftUI

struct NewsTabView: View {
    @State private var selectedCategory: NewsCategory = .all
    @State private var selectedSport = "Football"
    @State private var showSportPicker = false

    private var filteredArticles: [NewsArticle] {
        MockNewsData.articles(for: selectedCategory)
    }

    private var featuredArticle: NewsArticle? {
        filteredArticles.first { $0.isFeatured }
    }

    private var regularArticles: [NewsArticle] {
        filteredArticles.filter { !$0.isFeatured }
    }

    var body: some View {
        VStack(spacing: 0) {
            // Navigation Bar
            FSNavigationBar(
                sportName: selectedSport,
                hasNotification: false,
                onSportTap: {
                    showSportPicker = true
                },
                onGiftTap: {},
                onSearchTap: {},
                onProfileTap: {}
            )

            ScrollView {
                VStack(alignment: .leading, spacing: FSSpacing.md32) {
                    // Header
                    Text("News")
                        .font(.displayL)
                        .foregroundColor(.brandSlateBlack500)
                        .padding(.horizontal, FSSpacing.xs16)

                    // Category tabs
                    FSCategoryTabs(
                        categories: NewsCategory.allCases,
                        selectedCategory: $selectedCategory
                    )

                    // Top News section
                    if let featured = featuredArticle {
                        VStack(alignment: .leading, spacing: FSSpacing.xs16) {
                            Text("Top News")
                                .font(.headingM)
                                .foregroundColor(.brandSlateBlack500)
                                .padding(.horizontal, FSSpacing.xs16)

                            FSNewsCard(
                                imageName: featured.imageName,
                                title: featured.title,
                                isSponsored: featured.isSponsored,
                                isFeatured: true,
                                onTap: {}
                            )
                            .padding(.horizontal, FSSpacing.xs16)
                        }
                    }

                    // Regular news list
                    VStack(spacing: FSSpacing.xs16) {
                        ForEach(regularArticles) { article in
                            FSNewsCard(
                                imageName: article.imageName,
                                title: article.title,
                                isSponsored: article.isSponsored,
                                isFeatured: false,
                                onTap: {}
                            )
                            .padding(.horizontal, FSSpacing.xs16)

                            if article.id != regularArticles.last?.id {
                                Divider()
                                    .padding(.horizontal, FSSpacing.xs16)
                            }
                        }
                    }

                    // Bottom spacing
                    Color.clear.frame(height: FSSpacing.xl)
                }
                .padding(.top, FSSpacing.md32)
            }
            .background(Color.white)
        }
        .ignoresSafeArea(edges: .top)
        .sheet(isPresented: $showSportPicker) {
            SportPickerView(selectedSport: $selectedSport)
        }
    }
}

#Preview {
    NewsTabView()
}
