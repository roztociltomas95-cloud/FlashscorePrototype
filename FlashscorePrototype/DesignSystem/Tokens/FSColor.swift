import SwiftUI

// MARK: - Flashscore Design System Colors
// DO NOT modify these values without DesignOps approval
// Generated from primitive-fs-catalogue.json v1.0.4

extension Color {
    // MARK: - Brand Red
    // Brand color is applicable to text, icons, border and containers
    static let brandRed50 = Color(hex: "FFE6F3")
    static let brandRed400 = Color(hex: "FF336B")
    static let brandRed500 = Color(hex: "FF0046")
    static let brandRed600 = Color(hex: "E80040")
    static let brandRed700 = Color(hex: "C80037")
    static let brandRed800 = Color(hex: "8C0027")
    static let brandRed850 = Color(hex: "800023")
    static let brandRed900 = Color(hex: "3D0314")

    // MARK: - Brand Slate Black
    // Brand slate black is applicable to "black" text, dark mode app background
    static let brandSlateBlack500 = Color(hex: "001E28")
    static let brandSlateBlack600 = Color(hex: "01131F")
    static let brandSlateBlack900 = Color(hex: "010A0F")

    // MARK: - Slate Black Light
    // Slate black light is applicable to containers in dark mode that need to be elevated from background
    static let slateBlackLight100 = Color(hex: "B5BEC1")
    static let slateBlackLight200 = Color(hex: "919EA3")
    static let slateBlackLight300 = Color(hex: "5E7279")
    static let slateBlackLight400 = Color(hex: "213D46")
    static let slateBlackLight500 = Color(hex: "0F2D37")
    static let slateBlackLight700 = Color(hex: "0B2027")

    // MARK: - Chalk White
    // chalkWhite500 is the "white" text in dark mode
    static let chalkWhite400 = Color(hex: "F1F1F1")
    static let chalkWhite500 = Color(hex: "EEEEEE")
    static let chalkWhite600 = Color(hex: "D9D9D9")
    static let chalkWhite900 = Color(hex: "646464")

    // MARK: - Grey A
    // Grey A is suitable for secondary texts or bold separators
    static let greyA200 = Color(hex: "E6E8E8")
    static let greyA300 = Color(hex: "DCDFDF")
    static let greyA400 = Color(hex: "D6D9D9")
    static let greyA500 = Color(hex: "C8CDCD")
    static let greyA700 = Color(hex: "8E9292")
    static let greyA800 = Color(hex: "6E7171")

    // MARK: - Grey B
    // Grey B is suitable for tertiary texts or lighter separators
    static let greyB100 = Color(hex: "DFDFDF")
    static let greyB300 = Color(hex: "BBBBBB")
    static let greyB500 = Color(hex: "999999")
    static let greyB600 = Color(hex: "8B8B8B")
    static let greyB700 = Color(hex: "6D6D6D")

    // MARK: - Grey C
    // Grey C is suitable for grey secondary texts or icons
    static let greyC400 = Color(hex: "777E81")
    static let greyC500 = Color(hex: "555E61")
    static let greyC600 = Color(hex: "4D5658")
    static let greyC700 = Color(hex: "3C4345")
    static let greyC800 = Color(hex: "2F3435")
    static let greyC900 = Color(hex: "242729")

    // MARK: - Blue
    // Blue color is suitable for pinned states of leagues or matches, or any positive highlight for alerts or table rows
    static let blue50 = Color(hex: "EEF7FF")
    static let blue100 = Color(hex: "DFF1FC")
    static let blue200 = Color(hex: "8DC8FD")
    static let blue400 = Color(hex: "399FFB")
    static let blue500 = Color(hex: "0787FA")
    static let blue600 = Color(hex: "067BE4")
    static let blue800 = Color(hex: "033969")
    static let blue900 = Color(hex: "01203E")

    // MARK: - Green
    // Green color is for positive states
    static let green600 = Color(hex: "12C844")
    static let green700 = Color(hex: "1AB546")
    static let green800 = Color(hex: "0B7929")

    // MARK: - Yellow
    // Yellow color is for favorite highlight context
    static let yellow50 = Color(hex: "FFF2CE")
    static let yellow400 = Color(hex: "FFD733")
    static let yellow500 = Color(hex: "FFCD00")
    static let yellow700 = Color(hex: "B59200")

    // MARK: - Red
    // Red color is for negative context
    static let red50 = Color(hex: "FBE5E5")
    static let red400 = Color(hex: "E33333")
    static let red500 = Color(hex: "DC0000")
    static let red600 = Color(hex: "C80000")
    static let red700 = Color(hex: "9C0000")
    static let red900 = Color(hex: "2C0000")

    // MARK: - Gold
    // Gold color is associated with Odds text
    static let gold500 = Color(hex: "F5BA57")
    static let gold600 = Color(hex: "D19E4B")

    // MARK: - Base Colors
    // White in general
    static let white = Color(hex: "FFFFFF")

    // MARK: - Shaded Colors (with alpha)
    static let greyB20 = Color(hex: "99999933")
    static let chalkWhite10 = Color(hex: "EEEEEE1A")
    static let chalkWhite40 = Color(hex: "EEEEEE66")
    static let chalkWhite60 = Color(hex: "EEEEEE99")
    static let slateBlack40 = Color(hex: "001E2866")
    static let slateBlack60 = Color(hex: "001E2899")
    static let slateBlackDark60 = Color(hex: "010A0F99")
    static let slateBlackLight60 = Color(hex: "213D4699")
    static let black10 = Color(hex: "0000001A")
    static let white10 = Color(hex: "FFFFFF1A")
}

// MARK: - Color Extension Helpers

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 255, 255, 255)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
