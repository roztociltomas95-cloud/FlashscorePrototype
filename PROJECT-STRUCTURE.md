# FlashScore Prototype - Project Structure

## Current State: Fresh Xcode Project

```
FlashscorePrototype/
├── FlashscorePrototype.xcodeproj    # Xcode project file already created
├── FlashscorePrototype/             # Main source directory already created
│   ├── FlashscorePrototypeApp.swift # App entry point
│   ├── ContentView.swift            # Root view (placeholder)
│   └── Assets.xcassets/             # Asset catalog
│       ├── AppIcon.appiconset/
│       └── AccentColor.colorset/
├── PROJECT-CONTEXT.md               # Design system guide
└── PROJECT-STRUCTURE.md             # This file
```

---

## Planned Directory Structure

```
FlashscorePrototype/
├── PROJECT-CONTEXT.md              # Design system philosophy & guidelines
├── PROJECT-STRUCTURE.md            # This file
│
├── FlashscorePrototype/            # Main app source
│   ├── FlashscorePrototypeApp.swift  # @main App entry point
│   ├── ContentView.swift             # Root TabView container
│   │
│   ├── DesignSystem/                 # Layer 1 & 2: Tokens + Components
│   │   ├── Tokens/
│   │   │   ├── FSColor.swift         # Brand colors
│   │   │   ├── FSTypography.swift    # Text styles
│   │   │   ├── FSSpacing.swift       # 8pt grid spacing
│   │   │   └── FSShadow.swift        # Shadow styles (minimal use)
│   │   │
│   │   ├── Components/
│   │   │   ├── _INDEX.md             # Component catalog
│   │   │   ├── Primitives/
│   │   │   │   ├── FSButton.swift
│   │   │   │   ├── FSBadge.swift
│   │   │   │   ├── FSIcon.swift
│   │   │   │   └── FSImage.swift
│   │   │   │
│   │   │   └── Composed/
│   │   │       ├── FSMatchCard.swift
│   │   │       ├── FSTeamRow.swift
│   │   │       └── FSParticipantHeader.swift
│   │   │
│   │   └── Documentation/
│   │       ├── DesignPrinciples.md
│   │       └── ComponentGuidelines.md
│   │
│   ├── Features/                     # Layer 3: PM prototypes
│   │   ├── Matches/
│   │   │   ├── Views/
│   │   │   │   ├── MatchesTabView.swift
│   │   │   │   ├── MatchListView.swift
│   │   │   │   └── MatchDetailView.swift
│   │   │   ├── Models/
│   │   │   │   └── Match.swift
│   │   │   └── README.md
│   │   │
│   │   ├── Live/
│   │   │   ├── Views/
│   │   │   │   └── LiveTabView.swift
│   │   │   ├── Models/
│   │   │   └── README.md
│   │   │
│   │   ├── Favorites/
│   │   │   ├── Views/
│   │   │   │   └── FavoritesTabView.swift
│   │   │   ├── Models/
│   │   │   └── README.md
│   │   │
│   │   └── Standings/
│   │       ├── Views/
│   │       │   └── StandingsTabView.swift
│   │       ├── Models/
│   │       └── README.md
│   │
│   ├── Utilities/                    # Shared helpers
│   │   ├── MockData.swift
│   │   └── Extensions/
│   │       ├── Color+Hex.swift
│   │       └── View+Extensions.swift
│   │
│   └── Assets.xcassets/              # Asset catalog
│       ├── AppIcon.appiconset/
│       ├── AccentColor.colorset/
│       ├── Colors/                   # Brand color assets
│       │   ├── BrandRed.colorset
│       │   └── BrandSlateBlack.colorset
│       └── Icons/                    # Custom FlashScore icons
│           ├── icon-matches.imageset
│           ├── icon-live.imageset
│           ├── icon-favorites.imageset
│           └── icon-standings.imageset
```

---

## Key Files & Responsibilities

### Entry Point
- **FlashscorePrototypeApp.swift** - Main app struct with `@main`, initializes WindowGroup

### Root View
- **ContentView.swift** - TabView with 4 tabs (Matches, Live, Favorites, Standings)

### Layer 1: Design Tokens
- **FSColor.swift** - `brandRed500`, `brandSlateBlack500`, semantic colors
- **FSTypography.swift** - Inter font variants (headline, body, caption)
- **FSSpacing.swift** - 8pt grid system (`.xs`, `.sm`, `.md`, `.lg`, `.xl`)
- **FSShadow.swift** - Minimal shadow styles (rarely used)

### Layer 2: Components
- **Primitives/** - Atomic components (buttons, badges, icons)
- **Composed/** - Multi-primitive components (match cards, team rows)
- **_INDEX.md** - Searchable catalog of all components

### Layer 3: Features
- **Matches/**, **Live/**, **Favorites/**, **Standings/** - PM-requested prototypes
- Each feature has Views/, Models/, and README.md

### Utilities
- **MockData.swift** - Realistic sports data for prototypes
- **Extensions/** - SwiftUI helpers (Color+Hex, View modifiers)

---

## File Naming Conventions

### Swift Files
- **Design Tokens**: `FS[TokenType].swift` (e.g., `FSColor.swift`)
- **Components**: `FS[ComponentName].swift` (e.g., `FSButton.swift`)
- **Views**: `[FeatureName]View.swift` (e.g., `MatchDetailView.swift`)
- **Models**: `[ModelName].swift` (e.g., `Match.swift`)

### Prefixes
- **FS** = FlashScore (for all design system components)
- **Tab** = Tab-level root view (e.g., `MatchesTabView`)
- **Mock** = Mock data files (e.g., `MockMatchData`)

### Documentation
- **_INDEX.md** - Component catalog (always capitalized with underscore)
- **README.md** - Feature documentation
- **[Topic].md** - Design guidelines (e.g., `DesignPrinciples.md`)

---

## Asset Naming Conventions

### Colors
- `BrandRed.colorset` - Primary brand color
- `BrandSlateBlack.colorset` - Secondary brand color
- `Semantic[Usage].colorset` - e.g., `SemanticLive.colorset`

### Icons
- `icon-[name].imageset` - All lowercase, hyphen-separated
- Examples: `icon-matches`, `icon-live`, `icon-soccer`

### Images
- `image-[name].imageset` - Team logos, tournament badges
- Examples: `image-premier-league`, `image-arsenal-logo`

---

## Adding New Files: Quick Reference

### Adding a New Component
1. Create `DesignSystem/Components/[Category]/FS[Name].swift`
2. Use only design tokens from `Tokens/`
3. Add entry to `Components/_INDEX.md`
4. Include usage example in component comments

### Adding a New Feature
1. Create `Features/[FeatureName]/` directory
2. Add `Views/`, `Models/`, `README.md`
3. Compose from existing components first
4. Document component decisions in README

### Adding a New Icon
1. Add to `Assets.xcassets/Icons/icon-[name].imageset`
2. Access via `FSIcon(name: "icon-[name]")`
3. Update icon list in component documentation

---

## Build & Run

**Xcode**: Open `FlashscorePrototype.xcodeproj`
**Target**: iOS 16.0+
**Simulator**: iPhone 15 Pro recommended
**Build**: Cmd+B
**Run**: Cmd+R

---

## Git Workflow

**Current Branch**: `main`
**Protected**: Design tokens (`DesignSystem/Tokens/`) - require DesignOps approval
**Free to Modify**: Features, components (with documentation)

---

## Status: Project Initialization Phase

**Completed**:
- ✅ Xcode project created
- ✅ PROJECT-CONTEXT.md documentation
- ✅ PROJECT-STRUCTURE.md (this file)

**Next Steps**:
1. Create `DesignSystem/Tokens/` files (FSColor, FSTypography, FSSpacing)
2. Create `DesignSystem/Components/_INDEX.md`
3. Build primitive components (FSButton, FSBadge, FSIcon)
4. Create `Assets.xcassets/Colors/` and `Icons/`
5. Build ContentView with TabView structure
6. Create placeholder tab views for 4 main sections

---

**Last Updated**: 2025-11-06
