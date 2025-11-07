//
//  FSSportHeader.swift
//  FlashscorePrototype
//
//  Component: Sport selector header with action icons
//  Category: Composed
//

import SwiftUI

/// FlashScore sport header component
/// Displays sport selector dropdown and utility icons
struct FSSportHeader: View {

    // MARK: - Properties

    let sportName: String
    let onSportTap: () -> Void
    let onGiftTap: () -> Void
    let onSearchTap: () -> Void
    let onProfileTap: () -> Void

    // MARK: - Body

    var body: some View {
        HStack(spacing: FSSpacing.xs16) {
            // Sport selector
            Button(action: onSportTap) {
                HStack(spacing: FSSpacing.xxs8) {
                    Image(systemName: "sportscourt.fill")
                        .font(.system(size: 24))

                    Text(sportName)
                        .font(.headingL)

                    Image(systemName: "chevron.down")
                        .font(.system(size: 14, weight: .semibold))
                }
                .foregroundColor(.white)
            }

            Spacer()

            // Action icons
            HStack(spacing: FSSpacing.sm24) {
                Button(action: onGiftTap) {
                    Image(systemName: "gift.fill")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                }

                Button(action: onSearchTap) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                }

                Button(action: onProfileTap) {
                    Image(systemName: "person.fill")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.horizontal, FSSpacing.xs16)
        .padding(.vertical, FSSpacing.xxs8)
        .background(Color.brandSlateBlack500)
    }
}

// MARK: - Preview

#Preview("Sport Header") {
    VStack(spacing: 0) {
        FSSportHeader(
            sportName: "Football",
            onSportTap: {},
            onGiftTap: {},
            onSearchTap: {},
            onProfileTap: {}
        )

        Spacer()
    }
}
