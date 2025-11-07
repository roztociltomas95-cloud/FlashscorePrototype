//
//  FSIcon.swift
//  FlashscorePrototype
//
//  Component: Icon wrapper for FlashScore brand icons
//  Category: Primitive
//

import SwiftUI

/// FlashScore icon component
/// Wraps custom icons from Assets.xcassets/Icons/
struct FSIcon: View {

    // MARK: - Properties

    let name: String
    let size: IconSize
    let color: Color?

    // MARK: - Icon Sizes

    enum IconSize {
        case small      // 16pt
        case medium     // 24pt
        case large      // 32pt
        case custom(CGFloat)

        var dimension: CGFloat {
            switch self {
            case .small: return 16
            case .medium: return 24
            case .large: return 32
            case .custom(let value): return value
            }
        }
    }

    // MARK: - Initialization

    init(name: String, size: IconSize = .medium, color: Color? = nil) {
        self.name = name
        self.size = size
        self.color = color
    }

    // MARK: - Body

    var body: some View {
        Image(name)
            .resizable()
            .renderingMode(color != nil ? .template : .original)
            .aspectRatio(contentMode: .fit)
            .frame(width: size.dimension, height: size.dimension)
            .foregroundColor(color)
    }
}

// MARK: - Preview

#Preview("Icon Sizes") {
    VStack(spacing: FSSpacing.md32) {
        FSIcon(name: "icon-matches", size: .small)
        FSIcon(name: "icon-matches", size: .medium)
        FSIcon(name: "icon-matches", size: .large)
        FSIcon(name: "icon-matches", size: .medium, color: .brandRed500)
    }
    .padding()
}
