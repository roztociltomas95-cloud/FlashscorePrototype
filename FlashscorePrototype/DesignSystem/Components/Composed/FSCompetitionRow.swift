//
//  FSCompetitionRow.swift
//  FlashscorePrototype
//
//  Component: Competition row with flag/logo, name, country, and match count
//  Category: Composed
//

import SwiftUI

/// FlashScore competition row component
/// Displays competition with flag, name, country, and match count
struct FSCompetitionRow: View {

    // MARK: - Properties

    let logoName: String
    let competitionName: String
    let country: String
    let matchCount: Int
    let hasAudio: Bool
    let onTap: () -> Void

    // MARK: - Initialization

    init(
        logoName: String,
        competitionName: String,
        country: String,
        matchCount: Int,
        hasAudio: Bool = false,
        onTap: @escaping () -> Void = {}
    ) {
        self.logoName = logoName
        self.competitionName = competitionName
        self.country = country
        self.matchCount = matchCount
        self.hasAudio = hasAudio
        self.onTap = onTap
    }

    // MARK: - Body

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: FSSpacing.xs16) {
                // Flag/Logo
                FSAssetContainer.logo(logoName, size: .medium)

                // Competition info
                VStack(alignment: .leading, spacing: FSSpacing.xxxs4) {
                    Text(competitionName)
                        .font(.bodyMBold)
                        .foregroundColor(.brandSlateBlack500)

                    Text(country.uppercased())
                        .font(.labelMRegular)
                        .foregroundColor(.greyC500)
                }

                Spacer()

                // Audio indicator
                if hasAudio {
                    Image(systemName: "headphones")
                        .font(.system(size: 16))
                        .foregroundColor(.greyC500)
                }

                // Match count
                Text("\(matchCount)")
                    .font(.bodyMBold)
                    .foregroundColor(.brandSlateBlack500)
                    .frame(minWidth: 24)
            }
            .padding(.horizontal, FSSpacing.xs16)
            .padding(.vertical, FSSpacing.xxs8)
            .background(Color.white)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Preview

#Preview("Competition Rows") {
    VStack(spacing: 1) {
        FSCompetitionRow(
            logoName: "england",
            competitionName: "Premier League",
            country: "ENGLAND",
            matchCount: 8
        )

        FSCompetitionRow(
            logoName: "spain",
            competitionName: "La Liga",
            country: "SPAIN",
            matchCount: 5,
            hasAudio: true
        )

        FSCompetitionRow(
            logoName: "germany",
            competitionName: "Bundesliga",
            country: "GERMANY",
            matchCount: 3
        )
    }
    .background(Color.greyA200)
}
