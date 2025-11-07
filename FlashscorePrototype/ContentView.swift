//
//  ContentView.swift
//  FlashscorePrototype
//
//  Root view with 5-tab navigation structure
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Tab 1: Matches
            MatchesTabView()
                .tabItem {
                    Label("Matches", systemImage: "sportscourt")
                }

            // Tab 2: Live
            LiveTabView()
                .tabItem {
                    Label("Live", systemImage: "dot.radiowaves.left.and.right")
                }

            // Tab 3: Favorites
            FavoritesTabView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }

            // Tab 4: News
            NewsTabView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }

            // Tab 5: Standings
            StandingsTabView()
                .tabItem {
                    Label("Standings", systemImage: "list.number")
                }

        }
        .accentColor(.brandRed500)
    }
}

#Preview {
    ContentView()
}
