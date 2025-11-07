//
//  FSBadge.swift
//  FlashscorePrototype
//
//  Component: Badge for status indicators
//  Category: Primitive
//

import SwiftUI

/// FlashScore badge component for status display
struct FSBadge: View {

    // MARK: - Properties

    let text: String
    let variant: BadgeVariant

    // MARK: - Badge Variants

    enum BadgeVariant {
        case live           // Red background for LIVE matches
        case finished       // Gray background for finished matches
        case scheduled      // Slate background for upcoming matches
        case custom(backgroundColor: Color, textColor: Color)

        var backgroundColor: Color {
            switch self {
            case .live: return .brandRed500
            case .finished: return .greyA500
            case .scheduled: return .brandSlateBlack500
            case .custom(let bg, _): return bg
            }
        }

        var textColor: Color {
            switch self {
            case .live, .scheduled, .finished: return .white
            case .custom(_, let text): return text
            }
        }
    }

    // MARK: - Initialization

    init(text: String, variant: BadgeVariant = .live) {
        self.text = text
        self.variant = variant
    }

    // MARK: - Body

    var body: some View {
        Text(text.uppercased())
            .font(.caption2)
            .foregroundColor(variant.textColor)
            .padding(.horizontal, FSSpacing.Margin.small)
            .padding(.vertical, FSSpacing.Margin.small)
            .background(variant.backgroundColor)
            .cornerRadius(4)
    }
}

// MARK: - Preview

#Preview("Badge Variants") {
    VStack(spacing: FSSpacing.md32) {
        FSBadge(text: "LIVE", variant: .live)
        FSBadge(text: "FT", variant: .finished)
        FSBadge(text: "18:00", variant: .scheduled)
        FSBadge(text: "HT", variant: .custom(backgroundColor: .orange, textColor: .white))
    }
    .padding()
}
