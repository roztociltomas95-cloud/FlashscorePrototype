//
//  FavoritesTabView.swift
//  FlashscorePrototype
//
//  Feature: Favorites tab - User preferences over teams, players, favorite matches
//

import SwiftUI

struct FavoritesTabView: View {
    @State private var selectedCategory: FavoriteCategory = .teams
    @State private var selectedSport = "Football"
    @State private var showSportPicker = false

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
                    Text("Favourites")
                        .font(.displayL)
                        .foregroundColor(.brandSlateBlack500)
                        .padding(.horizontal, FSSpacing.xs16)

                    // Category tabs
                    HStack(spacing: FSSpacing.xxs8) {
                        ForEach(FavoriteCategory.allCases, id: \.self) { category in
                            CategoryTab(
                                title: category.displayName,
                                isSelected: selectedCategory == category,
                                onTap: {
                                    selectedCategory = category
                                }
                            )
                        }
                        Spacer()
                    }
                    .padding(.horizontal, FSSpacing.xs16)

                    // Content based on selected category
                    if selectedCategory == .teams {
                        VStack(spacing: 1) {
                            ForEach(MockFavoritesData.favoriteTeams) { team in
                                FSFavoriteTeamCard(
                                    teamName: team.name,
                                    logoName: team.logoName,
                                    league: team.league,
                                    onTap: {}
                                )

                                if team.id != MockFavoritesData.favoriteTeams.last?.id {
                                    Divider()
                                        .padding(.horizontal, FSSpacing.xs16)
                                }
                            }
                        }
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, FSSpacing.xs16)
                    } else {
                        // Matches category - empty state
                        VStack(spacing: FSSpacing.md32) {
                            Text("No favorite matches yet")
                                .font(.bodyMRegular)
                                .foregroundColor(.greyC500)
                                .padding(.top, FSSpacing.xs16)
                        }
                        .frame(maxWidth: .infinity)
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

private struct CategoryTab: View {
    let title: String
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            Text(title)
                .font(.labelMBold)
                .foregroundColor(isSelected ? .brandRed500 : .greyC500)
                .padding(.horizontal, FSSpacing.xs16)
                .padding(.vertical, FSSpacing.xxs8)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(isSelected ? Color.brandRed50 : Color.greyA200)
                )
        }
    }
}

#Preview {
    FavoritesTabView()
}
