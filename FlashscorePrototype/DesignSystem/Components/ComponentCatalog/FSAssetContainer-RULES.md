# FSAssetContainer - Usage Rules & Documentation

## Overview
FSAssetContainer is the **PRIMARY** component used to display player photos, team logos, tournament logos, and sport icons in the FlashScore app.

**CRITICAL RULE**: Never display images directly. Always wrap them in FSAssetContainer.

**EXCEPTION**: Match rows in lists (home vs away) may display logos directly with white background - this is the ONLY exception.

---

## Asset Directory Structure

```
Assets.xcassets/
├── PlayerPhotos/           # Player headshots and portraits
├── TeamLogos/              # Club and national team logos
├── TournamentLogos/        # League and competition badges
├── Icons/                  # Sport and UI icons
└── Placeholders/           # Fallback images when assets missing
    ├── Logo.imageset       # Generic team/tournament logo placeholder
    ├── Male.imageset       # Male player photo placeholder
    └── Female.imageset     # Female player photo placeholder
```

---

## Variant Rules

### 1. Player Variant (`.playerPhoto`)

**Asset Location**: `Assets.xcassets/PlayerPhotos/`

**Naming Convention**:
- `player-[lastname]-[firstname].imageset`
- Example: `player-messi-lionel.imageset`

**Usage**:
```swift
FSAssetContainer.playerPhoto("player-messi-lionel", size: .large)
```

**Use Cases**:
- Player detail pages
- Match lineups
- Player cards in match events
- Top scorer lists
- Player statistics views

**Content Mode**: `.fill` (crops to container)

---

### 2. Logo Variant (`.logo`)

**Asset Locations**:
- `Assets.xcassets/TeamLogos/` - Club and national teams
- `Assets.xcassets/TournamentLogos/` - Leagues and competitions

**Naming Convention**:
- Teams: `team-[name].imageset` (e.g., `team-arsenal.imageset`)
- Tournaments: `tournament-[name].imageset` (e.g., `tournament-premier-league.imageset`)

**Usage**:
```swift
// Team logo
FSAssetContainer.logo("team-arsenal", size: .medium)

// Tournament logo
FSAssetContainer.logo("tournament-premier-league", size: .large)
```

**Use Cases**:
- Match rows (home/away teams)
- Team detail headers
- Tournament headers
- League standings
- Match detail participant headers
- Favorite teams list

**Content Mode**: `.fit` (maintains aspect ratio)

---

### 3. Icon Variant (`.icon`)

**Asset Location**: `Assets.xcassets/Icons/`

**Naming Convention**:
- `icon-[name].imageset`
- Example: `icon-soccer.imageset`, `icon-tennis.imageset`

**Usage**:
```swift
FSAssetContainer.icon("icon-soccer", color: .brandRed500, size: .small)
```

**Use Cases**:
- Sport type indicators
- Category badges
- Action icons in match context
- Empty state illustrations

**Content Mode**: `.fit` (maintains aspect ratio)

**Color**: Can be tinted with optional color parameter

---

## Size Guidelines

### Small (32x32)
- Inline icons in match rows
- Secondary player photos in lists
- Compact team badges

### Medium (48x48)
- Standard match row team logos
- Player photos in lineups
- Tournament badges in section headers

### Large (64x64)
- Primary team logos in match detail
- Featured player photos
- Tournament headers
- Team detail page logos

### Custom
Use sparingly for special cases:
```swift
FSAssetContainer.logo("team-arsenal", size: .custom(80))
```

---

## Critical Usage Rules

### ✅ ALWAYS DO:
1. Use FSAssetContainer for ALL player photos, team logos, tournament logos (except match row lists)
2. Follow asset directory structure strictly
3. Use correct variant for content type
4. Specify appropriate size for context
5. Use placeholder images from `Assets/Placeholders/` when asset is missing:
   - `Placeholders/Logo` for team/tournament logos
   - `Placeholders/Male` for male player photos
   - `Placeholders/Female` for female player photos

### ❌ NEVER DO:
1. Display `Image()` directly for players/teams/tournaments (except match rows)
2. Mix asset directories (e.g., player photo in TeamLogos)
3. Use custom shapes (always use FSAssetContainer's rounded rectangle)
4. Skip the wrapper component for visual consistency (except match rows)
5. Hardcode sizes (use .small, .medium, .large)

### ⚠️ EXCEPTION: Match Rows
**Match rows in lists** (home vs away) are the ONLY case where you can display logos directly:
- Background: Always white
- No FSAssetContainer wrapper needed
- Use direct `Image()` for team logos in match rows
- This exception applies ONLY to horizontal match rows with home/away teams

---

## Common Patterns

### Match Row (Direct Image Exception)
```swift
HStack {
    // Home team - direct image, white background
    Image("Arsenal")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 48, height: 48)
    Text("Arsenal")

    Spacer()

    // Score
    Text("2 - 1")

    Spacer()

    // Away team - direct image, white background
    Text("Chelsea")
    Image("Chelsea")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 48, height: 48)
}
.padding()
.background(Color.white) // Always white background for match rows
```

### Match Detail Header
```swift
VStack {
    // Tournament
    FSAssetContainer.logo("tournament-premier-league", size: .large)

    HStack {
        // Home team
        VStack {
            FSAssetContainer.logo("team-arsenal", size: .large)
            Text("Arsenal")
        }

        // Score
        Text("2 - 1")

        // Away team
        VStack {
            FSAssetContainer.logo("team-chelsea", size: .large)
            Text("Chelsea")
        }
    }
}
```

### Player Card
```swift
VStack {
    FSAssetContainer.playerPhoto("player-messi-lionel", size: .large)
    Text("Lionel Messi")
        .font(.headingM)
    Text("Forward")
        .font(.bodyMRegular)
        .foregroundColor(.greyC500)
}
```

### Lineup List
```swift
ForEach(players) { player in
    HStack {
        Text(player.number)
        FSAssetContainer.playerPhoto(player.photoName, size: .small)
        Text(player.name)
        Spacer()
        Text(player.position)
    }
}
```

---

## Missing Assets

When an asset doesn't exist, use placeholder images from `Assets/Placeholders/`:

```swift
// For team/tournament logos
FSAssetContainer.logo("Placeholders/Logo", size: .medium)

// For male player photos
FSAssetContainer.playerPhoto("Placeholders/Male", size: .medium)

// For female player photos
FSAssetContainer.playerPhoto("Placeholders/Female", size: .medium)

// Conditional with fallback
let logoName = hasLogo ? "Arsenal" : "Placeholders/Logo"
FSAssetContainer.logo(logoName, size: .medium)
```

**Placeholder Usage**:
- `Placeholders/Logo` - Generic shield/crest icon for teams/tournaments
- `Placeholders/Male` - Silhouette for male players
- `Placeholders/Female` - Silhouette for female players

---

## Design Consistency

FSAssetContainer ensures:
- **8pt corner radius** across all images
- **Consistent sizing** (32, 48, 64)
- **Grey background** (`.greyA200`) for all variants
- **70% content scaling** for visual balance
- **Proper content modes** (fit for logos, fill for photos)

---

## Integration with Components

### FSMatchCard (future)
```swift
struct FSMatchCard: View {
    let homeTeam: String
    let awayTeam: String

    var body: some View {
        HStack {
            FSAssetContainer.logo("team-\(homeTeam)", size: .medium)
            // ... match info
            FSAssetContainer.logo("team-\(awayTeam)", size: .medium)
        }
    }
}
```

### FSPlayerRow (future)
```swift
struct FSPlayerRow: View {
    let playerPhoto: String
    let playerName: String

    var body: some View {
        HStack {
            FSAssetContainer.playerPhoto(playerPhoto, size: .small)
            Text(playerName)
        }
    }
}
```

---

## Asset Management Workflow

1. **Receive asset** from design team
2. **Determine type**: Player, Team, Tournament, or Icon
3. **Place in correct directory**:
   - PlayerPhotos → player photos
   - TeamLogos → team logos
   - TournamentLogos → tournament logos
   - Icons → sport/UI icons
4. **Follow naming convention**
5. **Use FSAssetContainer variant** matching the type

---

## Quality Standards

### Player Photos
- Aspect ratio: 1:1 (square)
- Min size: 256x256px
- Format: PNG with transparency or JPG
- Background: Transparent or solid color

### Team/Tournament Logos
- Aspect ratio: 1:1 preferred (or original)
- Min size: 256x256px
- Format: PNG with transparency
- Background: Transparent

### Icons
- Aspect ratio: 1:1
- Size: 128x128px
- Format: PNG or SVG
- Style: Outline or solid

---

## Examples in Context

### Match Detail
```swift
struct MatchDetailView: View {
    var body: some View {
        VStack(spacing: FSSpacing.lg) {
            // Tournament badge
            FSAssetContainer.logo("tournament-champions-league", size: .large)

            // Teams
            HStack(spacing: FSSpacing.xl) {
                VStack {
                    FSAssetContainer.logo("team-real-madrid", size: .large)
                    Text("Real Madrid")
                }

                Text("3 - 2")
                    .font(.scoreXL)

                VStack {
                    FSAssetContainer.logo("team-barcelona", size: .large)
                    Text("Barcelona")
                }
            }
        }
    }
}
```

### Team Detail
```swift
struct TeamDetailView: View {
    var body: some View {
        VStack {
            // Team logo header
            FSAssetContainer.logo("team-arsenal", size: .custom(96))
            Text("Arsenal FC")
                .font(.displayXL)

            // Squad list
            ForEach(players) { player in
                HStack {
                    FSAssetContainer.playerPhoto(player.photo, size: .medium)
                    VStack(alignment: .leading) {
                        Text(player.name)
                        Text(player.position)
                    }
                }
            }
        }
    }
}
```

---

**Last Updated**: 2025-11-06
**Component Version**: 1.0
**Maintained By**: DesignOps Team
