//
//  FSNewsCard.swift
//  FlashscorePrototype
//
//  News article card component - Displays news item with thumbnail and headline
//

import SwiftUI

struct FSNewsCard: View {
    let imageName: String
    let title: String
    let isSponsored: Bool
    let isFeatured: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            if isFeatured {
                featuredLayout
            } else {
                standardLayout
            }
        }
        .buttonStyle(.plain)
    }

    // Featured article with large image and overlay text
    private var featuredLayout: some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()

            // Dark gradient overlay
            LinearGradient(
                gradient: Gradient(colors: [.clear, .black.opacity(0.7)]),
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: FSSpacing.xxs8) {
                if isSponsored {
                    Text("Sponsored content")
                        .font(.labelMRegular)
                        .foregroundColor(.greyA500)
                }

                Text(title)
                    .font(.headingM)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
            }
            .padding(FSSpacing.xs16)
        }
        .cornerRadius(8)
    }

    // Standard list item with thumbnail on left
    private var standardLayout: some View {
        HStack(spacing: FSSpacing.xs16) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 88, height: 88)
                .clipped()
                .cornerRadius(8)

            Text(title)
                .font(.bodyMBold)
                .foregroundColor(.brandSlateBlack500)
                .multilineTextAlignment(.leading)
                .lineLimit(3)

            Spacer()
        }
        .padding(.vertical, FSSpacing.xxs8)
    }
}

#Preview {
    VStack(spacing: FSSpacing.md32) {
        // Featured
        FSNewsCard(
            imageName: "news-england-world-cup",
            title: "'We know how to win finals': England's Bronze targets World Cup gold",
            isSponsored: true,
            isFeatured: true,
            onTap: {}
        )

        // Standard
        FSNewsCard(
            imageName: "news-messi-miami",
            title: "Lionel Messi scores stunning stoppage-time winner on Inter Miami debut",
            isSponsored: false,
            isFeatured: false,
            onTap: {}
        )
    }
    .padding()
}
