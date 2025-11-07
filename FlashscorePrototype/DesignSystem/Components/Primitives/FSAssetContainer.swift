//
//  FSAssetContainer.swift
//  FlashscorePrototype
//
//  Component: Asset container for logos, player photos, and icons
//  Category: Primitive
//

import SwiftUI

/// FlashScore asset container component
/// Displays logos, player photos, or icons with consistent sizing and styling
struct FSAssetContainer: View {

    // MARK: - Properties

    let variant: AssetVariant
    let size: ContainerSize

    // MARK: - Asset Variants

    enum AssetVariant {
        case logo(String)           // Team/league logo
        case playerPhoto(String)    // Player photo
        case icon(String, Color?)   // Icon with optional color
        case placeholder            // Empty placeholder

        var contentMode: ContentMode {
            switch self {
            case .logo, .icon: return .fit
            case .playerPhoto: return .fill
            case .placeholder: return .fit
            }
        }

        var hasBackground: Bool {
            switch self {
            case .logo, .playerPhoto, .icon: return true
            case .placeholder: return true
            }
        }
    }

    // MARK: - Container Sizes

    enum ContainerSize {
        case small      // 32x32
        case medium     // 48x48
        case large      // 64x64
        case custom(CGFloat)

        var dimension: CGFloat {
            switch self {
            case .small: return 32
            case .medium: return 48
            case .large: return 64
            case .custom(let value): return value
            }
        }

        var cornerRadius: CGFloat {
            return 8
        }
    }

    // MARK: - Initialization

    init(variant: AssetVariant, size: ContainerSize = .large) {
        self.variant = variant
        self.size = size
    }

    // MARK: - Body

    var body: some View {
        ZStack {
            // Background
            RoundedRectangle(cornerRadius: size.cornerRadius)
                .fill(Color.greyA200)

            // Content
            contentView
                .frame(width: size.dimension * 0.7, height: size.dimension * 0.7)
        }
        .frame(width: size.dimension, height: size.dimension)
        .clipShape(RoundedRectangle(cornerRadius: size.cornerRadius))
    }

    // MARK: - Content View

    @ViewBuilder
    private var contentView: some View {
        switch variant {
        case .logo(let imageName):
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)

        case .playerPhoto(let imageName):
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)

        case .icon(let iconName, let color):
            Image(iconName)
                .resizable()
                .renderingMode(color != nil ? .template : .original)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(color)

        case .placeholder:
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.greyA500)
        }
    }
}

// MARK: - Convenience Initializers

extension FSAssetContainer {
    /// Create a logo container
    static func logo(_ imageName: String, size: ContainerSize = .large) -> FSAssetContainer {
        FSAssetContainer(variant: .logo(imageName), size: size)
    }

    /// Create a player photo container
    static func playerPhoto(_ imageName: String, size: ContainerSize = .large) -> FSAssetContainer {
        FSAssetContainer(variant: .playerPhoto(imageName), size: size)
    }

    /// Create an icon container
    static func icon(_ iconName: String, color: Color? = nil, size: ContainerSize = .large) -> FSAssetContainer {
        FSAssetContainer(variant: .icon(iconName, color), size: size)
    }

    /// Create a placeholder container
    static func placeholder(size: ContainerSize = .large) -> FSAssetContainer {
        FSAssetContainer(variant: .placeholder, size: size)
    }
}

// MARK: - Preview

#Preview("Asset Container Variants") {
    VStack(spacing: FSSpacing.md32) {
        HStack(spacing: FSSpacing.md32) {
            FSAssetContainer.placeholder(size: .small)
            FSAssetContainer.placeholder(size: .medium)
            FSAssetContainer.placeholder(size: .large)
        }

        HStack(spacing: FSSpacing.md32) {
            FSAssetContainer.icon("sportscourt", color: .brandRed500, size: .small)
            FSAssetContainer.icon("sportscourt", color: .brandRed500, size: .medium)
            FSAssetContainer.icon("sportscourt", color: .brandRed500, size: .large)
        }
    }
    .padding()
}
