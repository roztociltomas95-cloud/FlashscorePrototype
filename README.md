# ⚽️ FlashScore Prototype Kit

A **Design System Repository** for rapidly prototyping FlashScore iOS features using SwiftUI and Claude Code.

## 🎯 Purpose

This repository allows **Product Managers** (non-technical users) to prototype new FlashScore features by working with Claude Code agents. The design system provides pre-built brand components that agents can compose and extend without writing everything from scratch.

**Goal**: Clone → Request Feature → Build → Preview in Xcode

---

## 🚀 Quick Start

### Prerequisites
- **macOS** 13.0 or later
- **Xcode** 15.0 or later
- **iOS Simulator** or device running iOS 16.0+

### Getting Started
```bash
# Clone the repository
git clone <repository-url>
cd FlashscorePrototype

# Open in Xcode
open FlashscorePrototype.xcodeproj

# Build and run (Cmd+R)
```

---

## 📱 What's Inside

### Current Features (Phase 1 ✅)
- **5-Tab Navigation** - Matches, Live, Favorites, News, Standings
- **Matches Tab** - Competition list with date carousel and live match counts
- **News Tab** - Article feed with category filtering and featured stories
- **Favorites Tab** - Favorite teams with league info
- **Live & Standings Tabs** - Placeholder views ready for expansion

### Design System
- **Design Tokens** - Colors (brandRed500, brandSlateBlack500), Typography (Inter), Spacing (8pt grid)
- **Primitive Components** - FSButton, FSBadge, FSIcon, FSAssetContainer
- **Composed Components** - FSNavigationBar (Liquid Glass), FSNewsCard, FSFavoriteTeamCard, FSDateCarousel
- **Mock Data** - Realistic competition, news, and favorites data

---

## 🏗️ Architecture

### Three-Layer Structure

**Layer 1: Design Tokens** (Foundation)
```
DesignSystem/Tokens/
├── FSColor.swift       # Brand colors, semantic colors
├── FSTypography.swift  # Inter font system with helper
└── FSSpacing.swift     # 8pt grid spacing
```

**Layer 2: Components** (Building Blocks)
```
DesignSystem/Components/
├── Primitives/         # Buttons, badges, icons, containers
└── Composed/          # Navigation bars, cards, rows
```

**Layer 3: Features** (Compositions)
```
Features/
├── Matches/           # Competition list, match rows
├── Live/              # Live match updates
├── Favorites/         # Favorite teams & matches
├── News/              # News articles feed
└── Standings/         # League tables
```

---

## 🎨 Design Philosophy

### Brand Identity
- **Primary Color**: `#FF0046` - High energy red
- **Secondary Color**: `#001E28` - Trust-inspiring slate black
- **Typography**: Inter family - Modern, readable, clean
- **Style**: Bold, high-contrast, information-dense, mobile-first

### Component Guidelines
1. **Reuse First** - Search for existing components before creating new ones
2. **Compose Second** - Combine primitives to build complex UIs
3. **Create Third** - Only create new components when composition doesn't fit well
4. **Document Always** - Every new component needs usage documentation

---

## 📚 Documentation

### Essential Reading
- **[PROJECT-CONTEXT.md](PROJECT-CONTEXT.md)** - Design system philosophy, component guidelines, workflow rules
- **[PROJECT-STRUCTURE.md](PROJECT-STRUCTURE.md)** - Directory structure, naming conventions, file organization
- **[TODO.md](TODO.md)** - Current status, completed features, upcoming work
- **[FSAssetContainer-RULES.md](FlashscorePrototype/DesignSystem/Components/ComponentCatalog/FSAssetContainer-RULES.md)** - Image/asset handling rules

---

## 🤖 Working with Claude Code

### For Product Managers

**Request a new feature:**
```
"Build a player profile page showing photo, stats, and recent matches.
Use existing components from the design system."
```

**Claude Code will:**
1. Read PROJECT-CONTEXT.md and PROJECT-STRUCTURE.md
2. Check available components in DesignSystem/
3. Compose the feature using existing primitives
4. Create new components only if needed
5. Add mock data for realistic preview

### For Claude Code Agents

**Workflow:**
1. Read `PROJECT-CONTEXT.md` for design rules
2. Check `DesignSystem/Components/` for available components
3. Plan composition - which components to reuse?
4. Build feature using SwiftUI + existing components
5. Create new components if composition is too complex
6. Document new components in usage rules

**Example:**
```swift
// ✅ GOOD - Composing existing components
struct PlayerProfileView: View {
    var body: some View {
        VStack(spacing: FSSpacing.md) {
            FSAssetContainer.playerPhoto("player-messi-lionel", size: .large)
            Text("Lionel Messi").font(.headingM)
            FSBadge(text: "FORWARD", variant: .custom(backgroundColor: .greyA200, textColor: .brandSlateBlack500))
        }
    }
}
```

---

## 🎯 Current Status

**Phase**: 1 Complete ✅ → Phase 2 Starting
**Progress**: ~30% of full prototype kit

### ✅ What Works
- Complete design token system
- 5-tab navigation with Liquid Glass pattern
- Matches tab with competition list
- News tab with article feed
- Favorites tab with team cards
- All primitive components (Button, Badge, Icon, AssetContainer)
- Key composed components (NavigationBar, NewsCard, DateCarousel)

### 🚧 In Progress
- Component catalog documentation
- Placeholder image assets
- News article images

### 📋 Coming Next
- **Match Detail Pages** - Full match view with stats, lineups, timeline
- **Live Matches** - Real-time updates simulation
- **League Tables** - Complete standings with top scorers
- **Player/Team Pages** - Detailed profiles with stats
- **Modals** - Sport picker, settings, season selector

---

## 🛠️ Technical Details

### Platform
- **iOS**: 16.0+
- **Framework**: SwiftUI only (no UIKit)
- **Language**: Swift 5.9+
- **Dependencies**: None (pure SwiftUI)

### Design System
- **Grid**: 8pt base unit
- **Colors**: HEX-based with Color extension
- **Typography**: Inter font family (Regular, Medium, Bold)
- **Icons**: Custom assets in Assets.xcassets
- **Images**: FSAssetContainer wrapper for consistency

### Key Patterns
- **Asset Management**: All images wrapped in `FSAssetContainer` (except match row logos)
- **Spacing**: Use `FSSpacing` enum (`.xs`, `.sm`, `.md`, `.lg`, `.xl`)
- **Colors**: Use `Color.brandRed500`, `Color.greyC500` from `FSColor`
- **Typography**: Use `Font.headingM`, `Font.bodyMRegular` from `FSTypography`

---

## 📁 Repository Structure

```
FlashscorePrototype/
├── README.md                           # This file
├── TODO.md                            # Status & roadmap
├── PROJECT-CONTEXT.md                 # Design system guide
├── PROJECT-STRUCTURE.md               # Architecture reference
│
├── FlashscorePrototype.xcodeproj/     # Xcode project
│
└── FlashscorePrototype/               # Source code
    ├── ContentView.swift              # Root TabView
    │
    ├── DesignSystem/
    │   ├── Tokens/                    # FSColor, FSTypography, FSSpacing
    │   └── Components/
    │       ├── Primitives/            # FSButton, FSBadge, FSIcon, FSAssetContainer
    │       ├── Composed/              # FSNavigationBar, FSNewsCard, etc.
    │       └── ComponentCatalog/      # Usage documentation
    │
    ├── Features/
    │   ├── Matches/                   # Competition list
    │   ├── Live/                      # Live matches (placeholder)
    │   ├── Favorites/                 # Favorite teams
    │   ├── News/                      # News articles
    │   └── Standings/                 # League tables (placeholder)
    │
    ├── Utilities/                     # Mock data, extensions
    │
    └── Assets.xcassets/               # Images, icons, colors
        ├── TeamLogos/                 # Club & national team logos
        ├── Flags/                     # Country flags
        ├── Icons/                     # Custom sport icons
        └── Placeholders/              # Fallback images
```

---

## 🤝 Contributing

### Component Creation Guidelines
1. **Check existing components** - Review `DesignSystem/Components/` first
2. **Use design tokens only** - Never hardcode colors, spacing, or fonts
3. **Follow naming** - Prefix all components with `FS` (FlashScore)
4. **Document usage** - Add comments and usage examples
5. **Update catalog** - Add new components to documentation

### Design Token Rules
⚠️ **Design Tokens are protected** - Changes require DesignOps approval
- `FSColor.swift` - Brand colors are locked
- `FSTypography.swift` - Inter family is standard
- `FSSpacing.swift` - 8pt grid is fixed

---

## 📝 Example Usage

### Building a Simple Feature
```swift
// Create a match summary card
struct MatchSummaryCard: View {
    var body: some View {
        VStack(spacing: FSSpacing.md) {
            // Competition logo
            FSAssetContainer.logo("tournament-premier-league", size: .large)

            // Teams
            HStack(spacing: FSSpacing.lg) {
                VStack {
                    FSAssetContainer.logo("Arsenal", size: .medium)
                    Text("Arsenal").font(.bodyMBold)
                }

                Text("2 - 1").font(.headingM)

                VStack {
                    FSAssetContainer.logo("Chelsea", size: .medium)
                    Text("Chelsea").font(.bodyMBold)
                }
            }

            // Status
            FSBadge(text: "FINISHED", variant: .finished)
        }
        .padding(FSSpacing.md)
        .background(Color.white)
        .cornerRadius(8)
    }
}
```

---

## 🐛 Known Issues

- Placeholder images (Logo, Male, Female) not yet added to Assets
- News article images using placeholders
- Some composed components missing preview documentation

---

## 📞 Support

- **Design Questions**: Check PROJECT-CONTEXT.md
- **Component Questions**: Check component documentation in DesignSystem/
- **Technical Issues**: Claude Code agents handle most SwiftUI issues
- **Brand Changes**: Contact DesignOps team (tokens are protected)

---

## 📄 License

[Add your license here]

---

## 🙏 Acknowledgments

Built with:
- **SwiftUI** - Apple's declarative UI framework
- **Claude Code** - AI-powered development assistant
- **FlashScore Design System** - Brand guidelines and components

---

**Last Updated**: 2025-11-07
**Version**: 1.0-alpha
**Status**: Phase 1 Complete ✅
