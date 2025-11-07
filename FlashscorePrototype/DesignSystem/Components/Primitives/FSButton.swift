//
//  FSButton.swift
//  FlashscorePrototype
//
//  Component: Button with brand styling
//  Category: Primitive
//

import SwiftUI

/// FlashScore button component
struct FSButton: View {

    // MARK: - Properties

    let title: String
    let style: ButtonStyle
    let action: () -> Void

    // MARK: - Button Styles

    enum ButtonStyle {
        case primary        // Red background, white text
        case secondary      // White background, red border
        case ghost          // Transparent, text only

        var backgroundColor: Color {
            switch self {
            case .primary: return .brandRed500
            case .secondary: return .white
            case .ghost: return .clear
            }
        }

        var foregroundColor: Color {
            switch self {
            case .primary: return .white
            case .secondary: return .brandRed500
            case .ghost: return .brandRed500
            }
        }

        var borderColor: Color? {
            switch self {
            case .primary: return nil
            case .secondary: return .brandRed500
            case .ghost: return nil
            }
        }
    }

    // MARK: - Initialization

    init(title: String, style: ButtonStyle = .primary, action: @escaping () -> Void) {
        self.title = title
        self.style = style
        self.action = action
    }

    // MARK: - Body

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.actionPrimary)
                .foregroundColor(style.foregroundColor)
                .padding(.horizontal, FSSpacing.xs16)
                .padding(.vertical, FSSpacing.xxs8)
                .background(style.backgroundColor)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(style.borderColor ?? .clear, lineWidth: 1.5)
                )
        }
    }
}

// MARK: - Preview

#Preview("Button Styles") {
    VStack(spacing: FSSpacing.md32) {
        FSButton(title: "Primary Button", style: .primary) {}
        FSButton(title: "Secondary Button", style: .secondary) {}
        FSButton(title: "Ghost Button", style: .ghost) {}
    }
    .padding()
}
