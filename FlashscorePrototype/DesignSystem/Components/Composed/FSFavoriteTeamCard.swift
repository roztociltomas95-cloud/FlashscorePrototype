//
//  FSFavoriteTeamCard.swift
//  FlashscorePrototype
//
//  Favorite team card component - Displays team with logo and league
//

import SwiftUI

struct FSFavoriteTeamCard: View {
    let teamName: String
    let logoName: String
    let league: String
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: FSSpacing.xs16) {
                FSAssetContainer.logo(logoName, size: .medium)

                VStack(alignment: .leading, spacing: FSSpacing.xxxs4) {
                    Text(teamName)
                        .font(.bodyMBold)
                        .foregroundColor(.brandSlateBlack500)

                    Text(league.uppercased())
                        .font(.labelMRegular)
                        .foregroundColor(.greyC500)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(.greyC500)
            }
            .padding(.vertical, FSSpacing.xxs8)
            .padding(.horizontal, FSSpacing.xs16)
            .background(Color.white)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack(spacing: FSSpacing.xs16) {
        FSFavoriteTeamCard(
            teamName: "Arsenal",
            logoName: "Arsenal",
            league: "Premier League",
            onTap: {}
        )

        FSFavoriteTeamCard(
            teamName: "Liverpool",
            logoName: "Liverpool",
            league: "Premier League",
            onTap: {}
        )
    }
    .background(Color.greyA200)
}
