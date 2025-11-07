//
//  MatchesTabView.swift
//  FlashscorePrototype
//
//  Feature: Matches tab - Live scores, match lists, match details
//

import SwiftUI

struct MatchesTabView: View {
    @State private var selectedSport = "Football"
    @State private var showSportPicker = false

    // Get top 5 football articles for featured widget
    private var featuredArticles: [NewsArticle] {
        MockNewsData.articles
            .filter { $0.category == .football }
            .prefix(5)
            .map { $0 }
    }

    var body: some View {
        VStack(spacing: 0) {
            // Navigation Bar
            FSNavigationBar(
                sportName: selectedSport,
                hasNotification: true,
                onSportTap: {
                    showSportPicker = true
                },
                onGiftTap: {},
                onSearchTap: {},
                onProfileTap: {}
            )

            // Date carousel
            FSDateCarousel()

            // Featured article widget
            FSFeaturedArticleWidget(
                articles: featuredArticles,
                onArticleTap: { article in
                    // TODO: Navigate to article detail
                }
            )
            .background(Color.white)

            // All games header
            VStack(spacing: 0) {
                Divider()
                    .background(Color.greyA300)

                HStack {
                    HStack(spacing: FSSpacing.xxs8) {
                        Image(systemName: "line.3.horizontal")
                            .font(.system(size: 18))
                            .foregroundColor(.brandSlateBlack500)

                        Text("All games")
                            .font(.headingM)
                            .foregroundColor(.brandSlateBlack500)
                    }

                    Spacer()

                    HStack(spacing: FSSpacing.xs16) {
                        Image(systemName: "headphones")
                            .font(.system(size: 16))
                            .foregroundColor(.greyC500)

                        Text("11")
                            .font(.bodyMBold)
                            .foregroundColor(.white)
                            .frame(minWidth: 32)
                            .padding(.vertical, FSSpacing.xxxs4)
                            .background(Color.brandRed500)
                            .cornerRadius(4)

                        Text("109")
                            .font(.bodyMBold)
                            .foregroundColor(.greyC500)
                    }
                }
                .padding(.horizontal, FSSpacing.xs16)
                .padding(.vertical, FSSpacing.xxs8)
                .background(Color.white)
            }
            .background(Color.white)

            // Competitions header
            HStack {
                Text("COMPETITIONS [A-Z]")
                    .font(.labelMBold)
                    .foregroundColor(.greyC500)

                Spacer()
            }
            .padding(.horizontal, FSSpacing.xs16)
            .padding(.vertical, FSSpacing.xxs8)
            .background(Color.greyA200)
            
            // Competition list
            ScrollView {
                VStack(spacing: 1) {
                    ForEach(MockCompetitionData.footballCompetitions) { competition in
                        FSCompetitionRow(
                            logoName: competition.logoName,
                            competitionName: competition.name,
                            country: competition.country,
                            matchCount: competition.matchCount,
                            hasAudio: competition.hasAudio
                        )
                    }
                }
            }
            .background(Color.greyA200)
        }
        .ignoresSafeArea(edges: .top)
        .sheet(isPresented: $showSportPicker) {
            SportPickerView(selectedSport: $selectedSport)
        }
    }
}

#Preview {
    MatchesTabView()
}
