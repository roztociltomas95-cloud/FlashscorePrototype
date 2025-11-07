//
//  FSNavigationBar.swift
//  FlashscorePrototype
//
//  Component: Navigation bar with Apple Liquid Glass pattern
//  Category: Composed
//

import SwiftUI

/// FlashScore navigation bar component with Liquid Glass effect
/// Displays sport selector and action icons with translucent glass effect
struct FSNavigationBar: View {

    // MARK: - Properties

    let sportName: String
    let hasNotification: Bool
    let onSportTap: () -> Void
    let onGiftTap: () -> Void
    let onSearchTap: () -> Void
    let onProfileTap: () -> Void

    // MARK: - Initialization

    init(
        sportName: String,
        hasNotification: Bool = false,
        onSportTap: @escaping () -> Void = {},
        onGiftTap: @escaping () -> Void = {},
        onSearchTap: @escaping () -> Void = {},
        onProfileTap: @escaping () -> Void = {}
    ) {
        self.sportName = sportName
        self.hasNotification = hasNotification
        self.onSportTap = onSportTap
        self.onGiftTap = onGiftTap
        self.onSearchTap = onSearchTap
        self.onProfileTap = onProfileTap
    }

    // MARK: - Body

    var body: some View {
        ZStack {
            // Liquid Glass background
            liquidGlassBackground

            // Content
            HStack(spacing: FSSpacing.xs16) {
                // Sport selector
                Button(action: onSportTap) {
                    HStack(spacing: FSSpacing.xxs8) {
                        Image(systemName: "sportscourt.fill")
                            .font(.system(size: 28))

                        Text(sportName)
                            .font(.headingXL)

                        Image(systemName: "chevron.down")
                            .font(.system(size: 14, weight: .bold))
                    }
                    .foregroundColor(.white)
                }

                Spacer()

                // Action icons
                HStack(spacing: FSSpacing.sm24) {
                    // Gift icon with notification badge
                    ZStack(alignment: .topTrailing) {
                        Button(action: onGiftTap) {
                            Image(systemName: "gift.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }

                        if hasNotification {
                            Circle()
                                .fill(Color.brandRed500)
                                .frame(width: 12, height: 12)
                                .offset(x: 4, y: -4)
                        }
                    }

                    Button(action: onSearchTap) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.white)
                    }

                    Button(action: onProfileTap) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 28))
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.horizontal, FSSpacing.xs16)
            .padding(.top, 48) // Status bar height
            .padding(.bottom, FSSpacing.xxs8)
        }
        .frame(height: 100)
    }

    // MARK: - Liquid Glass Background

    private var liquidGlassBackground: some View {
        ZStack {
            // Base dark background
            Color.brandSlateBlack500

            // Translucent overlay
            Color.brandSlateBlack500.opacity(0.8)

            // Glass blur effect
            Rectangle()
                .fill(.ultraThinMaterial)
                .opacity(0.3)
        }
    }
}

// MARK: - Preview

#Preview("Navigation Bar") {
    VStack(spacing: 0) {
        FSNavigationBar(
            sportName: "Football",
            hasNotification: true
        )

        Spacer()
    }
    .background(Color.greyA200)
}

#Preview("Navigation Bar - No Notification") {
    VStack(spacing: 0) {
        FSNavigationBar(
            sportName: "Football",
            hasNotification: false
        )

        Spacer()
    }
    .background(Color.greyA200)
}
