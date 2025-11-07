import SwiftUI

// MARK: - Flashscore Typography System
// DO NOT modify these values without DesignOps approval
// Generated from typography.json v1.0.4

extension Font {
    /// Custom font helper that properly maps weights to Inter font files
    static func inter(size: CGFloat, weight: InterWeight) -> Font {
        let fontName: String
        switch weight {
        case .regular:
            fontName = "Inter-Regular"
        case .medium:
            fontName = "Inter-Medium"
        case .bold:
            fontName = "Inter-Bold"
        case .flashDisplay:
            fontName = "Flash Display"
        }
        return Font.custom(fontName, size: size)
    }

    enum InterWeight {
            case regular    // 400
            case medium     // 500
            case bold       // 700
            case flashDisplay // Flash Display for numbers
        }
}
    
extension Font {
    // MARK: - Display & Headings (32pt - 12pt)
    // Use for page titles, section headers, and primary hierarchical content

    /// Display XL - 32pt Bold | Use for hero sections and main page titles
    static let displayXL = Font.inter(size: 32, weight: .bold)

    /// Display L - 24pt Bold | Use for primary page headers and major sections
    static let displayL = Font.inter(size: 24, weight: .bold)

    /// Heading XL - 20pt Bold | Use for secondary headers and card titles
    static let headingXL = Font.inter(size: 20, weight: .bold)

    /// Heading L - 18pt Bold | Use for subsection headers and list group titles
    static let headingL = Font.inter(size: 18, weight: .bold)

    /// Heading M - 16pt Bold | Use for card headers and inline section titles
    static let headingM = Font.inter(size: 16, weight: .bold)

    
    /// Heading S - 14pt Bold | Use for compact headers and emphasized labels
    static let headingS = Font.inter(size: 14, weight: .bold)

    /// Heading XS - 12pt Bold | Use for small headers and category labels
    static let headingXS = Font.inter(size: 12, weight: .bold)

    // MARK: - Body Text (16pt - 14pt)
    // Use for primary readable content, descriptions, and paragraphs

    /// Body L Regular - 16pt Regular | Use for primary content and article text
    static let bodyLRegular = Font.inter(size: 16, weight: .regular)

    /// Body L Bold - 16pt Bold | Use for emphasized content and strong text
    static let bodyLBold = Font.inter(size: 16, weight: .bold)

    /// Body M Regular - 14pt Regular | Use for secondary content and compact text
    static let bodyMRegular = Font.inter(size: 14, weight: .regular)

    /// Body M Bold - 14pt Bold | Use for emphasized secondary content
    static let bodyMBold = Font.inter(size: 14, weight: .bold)

    /// Body M Heavy - 14pt Extra Bold | Use for strong emphasis in compact spaces
    static let bodyMHeavy = Font.inter(size: 14, weight: .bold)

    // MARK: - Subtitles (16pt - 12pt)
    // Use for supporting text below headers and descriptive labels

    /// Subtitle L - 16pt Bold | Use for prominent supporting text and subheaders
    static let subtitleL = Font.inter(size: 16, weight: .bold)

    /// Subtitle S - 12pt Bold | Use for compact supporting text and metadata
    static let subtitleS = Font.inter(size: 12, weight: .bold)

    // MARK: - Captions (16pt - 14pt)
    // Use for supplementary information, metadata, and fine print

    /// Caption L Regular - 16pt Regular | Use for large supplementary text
    static let captionLRegular = Font.inter(size: 16, weight: .regular)

    /// Caption L Bold - 16pt Bold | Use for emphasized supplementary text
    static let captionLBold = Font.inter(size: 16, weight: .bold)

    /// Caption L Heavy - 16pt Extra Bold | Use for strong caption emphasis
    static let captionLHeavy = Font.inter(size: 16, weight: .bold)

    /// Caption M Regular - 14pt Regular | Use for standard metadata and descriptions
    static let captionMRegular = Font.inter(size: 14, weight: .regular)

    /// Caption M Bold - 14pt Bold | Use for emphasized metadata
    static let captionMBold = Font.inter(size: 14, weight: .bold)

    /// Caption M Heavy - 14pt Extra Bold | Use for strong metadata emphasis
    static let captionMHeavy = Font.inter(size: 14, weight: .bold)

    // MARK: - Labels (12pt - 8pt)
    // Use for UI labels, tags, badges, and small interactive elements

    /// Label L Regular - 12pt Regular | Use for standard labels and UI text
    static let labelLRegular = Font.inter(size: 12, weight: .regular)

    /// Label L Bold - 12pt Bold | Use for emphasized labels and active states
    static let labelLBold = Font.inter(size: 12, weight: .bold)

    /// Label M Regular - 10pt Regular | Use for compact labels and tags
    static let labelMRegular = Font.inter(size: 10, weight: .regular)

    /// Label M Bold - 10pt Bold | Use for emphasized compact labels
    static let labelMBold = Font.inter(size: 10, weight: .bold)

    /// Label S Regular - 9pt Regular | Use for small tags and minimal UI text
    static let labelSRegular = Font.inter(size: 9, weight: .regular)

    /// Label S Bold - 9pt Bold | Use for emphasized small tags
    static let labelSBold = Font.inter(size: 9, weight: .bold)

    /// Label XS Regular - 8pt Regular | Use for minimal labels and fine print
    static let labelXSRegular = Font.inter(size: 8, weight: .regular)

    /// Label XS Bold - 8pt Bold | Use for emphasized minimal labels
    static let labelXSBold = Font.inter(size: 8, weight: .bold)

    // MARK: - Scores (32pt - 8pt, FS Numbers)
    // Use exclusively for displaying match scores and game statistics

    /// Score XL - 32pt Regular | Use for hero score displays and final results
    static let scoreXL = Font.custom("FS Numbers", size: 32)

    /// Score L - 28pt Regular | Use for primary score displays in cards
    static let scoreL = Font.custom("FS Numbers", size: 28)

    /// Score M - 20pt Regular | Use for secondary score displays
    static let scoreM = Font.custom("FS Numbers", size: 20)

    /// Score S - 16pt Regular | Use for compact score displays in lists
    static let scoreS = Font.custom("FS Numbers", size: 16)

    /// Score XS - 8pt Regular | Use for minimal score indicators
    static let scoreXS = Font.custom("FS Numbers", size: 8)

    // MARK: - Action Elements (14pt - 12pt)
    // Use for interactive buttons, links, and call-to-action elements

    /// Action Primary - 14pt Bold | Use for primary buttons and main CTAs
    static let actionPrimary = Font.inter(size: 14, weight: .bold)

    /// Action Secondary - 12pt Regular | Use for badges and secondary actions
    static let actionSecondary = Font.inter(size: 12, weight: .regular)
}

// MARK: - Typography Style with Line Height

struct TypographyStyle {
    let font: Font
    let lineHeight: CGFloat?
    let textCase: Text.Case?

    init(font: Font, lineHeight: CGFloat? = nil, textCase: Text.Case? = nil) {
        self.font = font
        self.lineHeight = lineHeight
        self.textCase = textCase
    }
}

extension View {
    /// Apply complete typography style including font and line height
    func typographyStyle(_ style: TypographyStyle) -> some View {
        self
            .font(style.font)
            .lineSpacing(style.lineHeight ?? 0)
    }
}

// MARK: - Predefined Typography Styles

extension TypographyStyle {
    // Display & Headings
    static let displayXL = TypographyStyle(font: .displayXL)
    static let displayL = TypographyStyle(font: .displayL, lineHeight: 28)
    static let headingXL = TypographyStyle(font: .headingXL, lineHeight: 24)
    static let headingL = TypographyStyle(font: .headingL, lineHeight: 24)
    static let headingM = TypographyStyle(font: .headingM, lineHeight: 20)
    static let headingS = TypographyStyle(font: .headingS, lineHeight: 18)
    static let headingXS = TypographyStyle(font: .headingXS, lineHeight: 14)

    // Body
    static let bodyLRegular = TypographyStyle(font: .bodyLRegular, lineHeight: 24)
    static let bodyLBold = TypographyStyle(font: .bodyLBold, lineHeight: 24)
    static let bodyMRegular = TypographyStyle(font: .bodyMRegular, lineHeight: 20)
    static let bodyMBold = TypographyStyle(font: .bodyMBold, lineHeight: 20)
    static let bodyMHeavy = TypographyStyle(font: .bodyMHeavy, lineHeight: 20)

    // Subtitles
    static let subtitleL = TypographyStyle(font: .subtitleL)
    static let subtitleS = TypographyStyle(font: .subtitleS, lineHeight: 12)

    // Captions
    static let captionLRegular = TypographyStyle(font: .captionLRegular, lineHeight: 16)
    static let captionLBold = TypographyStyle(font: .captionLBold, lineHeight: 16)
    static let captionLHeavy = TypographyStyle(font: .captionLHeavy, lineHeight: 16)
    static let captionMRegular = TypographyStyle(font: .captionMRegular, lineHeight: 18)
    static let captionMBold = TypographyStyle(font: .captionMBold, lineHeight: 18)
    static let captionMHeavy = TypographyStyle(font: .captionMHeavy, lineHeight: 18)

    // Labels
    static let labelLRegular = TypographyStyle(font: .labelLRegular, lineHeight: 16)
    static let labelLBold = TypographyStyle(font: .labelLBold, lineHeight: 12)
    static let labelMRegular = TypographyStyle(font: .labelMRegular, lineHeight: 12)
    static let labelMBold = TypographyStyle(font: .labelMBold, lineHeight: 10)
    static let labelSRegular = TypographyStyle(font: .labelSRegular, lineHeight: 10)
    static let labelSBold = TypographyStyle(font: .labelSBold, lineHeight: 10)
    static let labelXSRegular = TypographyStyle(font: .labelXSRegular)
    static let labelXSBold = TypographyStyle(font: .labelXSBold)

    // Scores
    static let scoreXL = TypographyStyle(font: .scoreXL)
    static let scoreL = TypographyStyle(font: .scoreL)
    static let scoreM = TypographyStyle(font: .scoreM)
    static let scoreS = TypographyStyle(font: .scoreS, lineHeight: 20)
    static let scoreXS = TypographyStyle(font: .scoreXS, lineHeight: 10)

    // Actions
    static let actionPrimary = TypographyStyle(font: .actionPrimary, lineHeight: 18)
    static let actionSecondary = TypographyStyle(font: .actionSecondary, lineHeight: 16)
}
