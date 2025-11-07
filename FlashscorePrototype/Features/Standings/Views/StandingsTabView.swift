//
//  StandingsTabView.swift
//  FlashscorePrototype
//
//  Feature: Standings tab - League tables and rankings
//

import SwiftUI

struct StandingsTabView: View {
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

            VStack(spacing: FSSpacing.md32) {
                Text("Standings")
                    .font(.displayL)
                    .foregroundColor(.brandSlateBlack500)

                Text("League tables and rankings")
                    .font(.bodyMRegular)
                    .foregroundColor(.greyC500)

                FSButton(title: "View Premier League", style: .secondary) {
                    // Action
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
        .ignoresSafeArea(edges: .top)
        .sheet(isPresented: $showSportPicker) {
            SportPickerView(selectedSport: $selectedSport)
        }
    }
}

#Preview {
    StandingsTabView()
}
