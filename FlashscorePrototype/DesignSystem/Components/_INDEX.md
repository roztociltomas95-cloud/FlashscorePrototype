# FlashScore Component Catalog

**Last Updated**: 2025-11-06

This is the master catalog of all available components in the FlashScore design system. **Always check this file before creating new components.**

---

## Design Tokens (Layer 1)

Foundation elements that all components use. **DO NOT modify without DesignOps approval.**

### FSColor
**Location**: `DesignSystem/Tokens/FSColor.swift`

**Brand Colors**:
- `.brandRed500` - Primary brand color (#FF0046)
- `.brandSlateBlack500` - Secondary brand color (#001E28)

**Semantic Colors**:
- `.fsLive` - Live match indicator
- `.fsFinished` - Finished match status
- `.fsScheduled` - Scheduled match
- `.fsBackground` / `.fsBackgroundSecondary`
- `.fsTextPrimary` / `.fsTextSecondary` / `.fsTextInverse`
- `.fsBorder` / `.fsBorderActive`

**Utility**:
- `Color(hex: String)` - Initialize from hex string

---

### FSTypography
**Location**: `DesignSystem/Tokens/FSTypography.swift`

**Headlines**:
- `.headlineXL` (28pt, bold)
- `.headlineLarge` (24pt, bold)
- `.headlineMedium` (20pt, bold)
- `.headlineSmall` (18pt, semibold)

**Body**:
- `.bodyLarge` (16pt)
- `.bodyMedium` (14pt)
- `.bodySmall` (13pt)

**Captions**:
- `.captionLarge` (12pt, medium)
- `.captionMedium` (11pt, medium)
- `.captionSmall` (10pt)

**Specialized**:
- `.scoreDisplay` (32pt, bold) - Large scores
- `.matchTime` (14pt, semibold) - Live times
- `.teamName` (15pt, medium) - Team names
- `.buttonLabel` (15pt, semibold) - Buttons
- `.badgeLabel` (11pt, bold) - Badges

---

### FSSpacing
**Location**: `DesignSystem/Tokens/FSSpacing.swift`

**Base Scale** (8pt grid):
- `.xxs` = 4pt
- `.xs` = 8pt
- `.sm` = 12pt
- `.md` = 16pt
- `.lg` = 24pt
- `.xl` = 32pt
- `.xxl` = 40pt

**Component-Specific**:
- `.cardPadding` = 16pt
- `.matchRowGap` = 8pt
- `.screenMargin` = 16pt
- `.sectionGap` = 24pt
- `.buttonPaddingVertical` = 12pt
- `.buttonPaddingHorizontal` = 16pt
- `.badgePadding` = 4pt

---

## Primitive Components (Layer 2)

Basic building blocks. Compose these to build features.

### FSIcon
**Location**: `DesignSystem/Components/Primitives/FSIcon.swift`

**Purpose**: Wrapper for custom FlashScore icons from Assets

**Usage**:
```swift
FSIcon(name: "icon-matches", size: .medium)
FSIcon(name: "icon-live", size: .small, color: .fsLive)
```

**Sizes**:
- `.small` (16pt)
- `.medium` (24pt)
- `.large` (32pt)
- `.custom(CGFloat)`

**Props**:
- `name: String` - Icon name from Assets.xcassets/Icons/
- `size: IconSize` - Icon size
- `color: Color?` - Optional tint color

**When to Use**:
- Tab bar icons
- Action buttons
- Visual indicators
- Custom branded icons

**When NOT to Use**:
- Use SF Symbols for system icons (rare in FlashScore)

---

### FSButton
**Location**: `DesignSystem/Components/Primitives/FSButton.swift`

**Purpose**: Branded button with multiple styles

**Usage**:
```swift
FSButton(title: "View Stats", style: .primary) { }
FSButton(title: "Cancel", style: .secondary) { }
FSButton(title: "Learn More", style: .ghost) { }
```

**Styles**:
- `.primary` - Red background, white text
- `.secondary` - White background, red border
- `.ghost` - Transparent, text only

**Props**:
- `title: String` - Button label
- `style: ButtonStyle` - Visual variant
- `action: () -> Void` - Tap handler

**When to Use**:
- Primary actions (subscribe, follow)
- Secondary actions (view details)
- Inline text links (ghost variant)

**When NOT to Use**:
- Navigation (use NavigationLink)
- Simple icons (use FSIcon with tap gesture)

---

### FSBadge
**Location**: `DesignSystem/Components/Primitives/FSBadge.swift`

**Purpose**: Status indicator for match states

**Usage**:
```swift
FSBadge(text: "LIVE", variant: .live)
FSBadge(text: "FT", variant: .finished)
FSBadge(text: "18:00", variant: .scheduled)
```

**Variants**:
- `.live` - Red background for live matches
- `.finished` - Gray background for finished
- `.scheduled` - Slate background for upcoming
- `.custom(backgroundColor: Color, textColor: Color)`

**Props**:
- `text: String` - Badge text (auto-uppercased)
- `variant: BadgeVariant` - Color style

**When to Use**:
- Match status (LIVE, FT, HT)
- Time indicators (18:00, 45'+2)
- Small labels and tags

**When NOT to Use**:
- Buttons (use FSButton)
- Large status messages (use Text with styling)

---

## Composed Components (Layer 2)

Coming soon:
- `FSMatchCard` - Standard match display card
- `FSTeamRow` - Team name + logo + score
- `FSParticipantHeader` - Match participants header

---

## Component Decision Guide

### Before Creating New Components:

1. **Search this file** - Is there an existing component?
2. **Check if composition works** - Can you combine 2-3 primitives?
3. **Evaluate reusability** - Will this be used 3+ times?
4. **Consider complexity** - Does it have unique state/logic?

### Create New Component When:
- ✅ Existing components need heavy customization
- ✅ Pattern repeats 3+ times across features
- ✅ Has unique internal state or logic
- ✅ Composition becomes too complex

### Don't Create New Component When:
- ❌ Simple modifier achieves the goal
- ❌ One-off custom layout
- ❌ Can compose cleanly from 2-3 primitives

---

## Adding New Components

When you create a new component:

1. Place in appropriate directory (`Primitives/` or `Composed/`)
2. Use design tokens exclusively (no hardcoded values)
3. Add to this catalog with:
   - Location path
   - Purpose description
   - Usage examples
   - Props documentation
   - When to use / when NOT to use
4. Include `#Preview` in component file
5. Add visual reference if possible

---

## Icons Reference

**Available Icons** (in `Assets.xcassets/Icons/`):
- `icon-matches` - Matches tab icon
- `icon-live` - Live tab icon
- `icon-favorites` - Favorites tab icon
- `icon-standings` - Standings tab icon

*More icons to be added as needed*

---

## Usage Examples

### Example 1: Match Status Display
```swift
HStack {
    FSBadge(text: "LIVE", variant: .live)
    Text("45'+2")
        .font(FSTypography.matchTime)
        .foregroundColor(.fsTextSecondary)
}
```

### Example 2: Team Score Row
```swift
HStack {
    FSIcon(name: "team-arsenal", size: .small)
    Text("Arsenal")
        .font(FSTypography.teamName)
    Spacer()
    Text("2")
        .font(FSTypography.scoreDisplay)
}
.padding(FSSpacing.md)
```

### Example 3: Action Buttons
```swift
VStack(spacing: FSSpacing.sm) {
    FSButton(title: "Follow Team", style: .primary) {
        // Action
    }
    FSButton(title: "View Stats", style: .secondary) {
        // Action
    }
}
```

---

**Questions?** Check `DesignSystem/Documentation/` for design guidelines.
