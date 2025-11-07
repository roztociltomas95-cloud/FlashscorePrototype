//
//  LiveTabView.swift
//  FlashscorePrototype
//
//  Feature: Live tab - All live matches today
//

import SwiftUI

struct LiveTabView: View {
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
                FSBadge(text: "LIVE", variant: .live)

                Text("Live Matches")
                    .font(.displayL)
                    .foregroundColor(.brandSlateBlack500)

                Text("Real-time updates coming soon")
                    .font(.bodyMRegular)
                    .foregroundColor(.greyC500)
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
    LiveTabView()
}
