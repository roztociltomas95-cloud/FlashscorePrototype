# FlashScore Prototype Kit - Project Context

You are helping build a **Design System Prototype Repository** for Flashscore, a sports scores mobile application (primarily football/soccer).

## What Flashscore Is:
- Real-time sports scores and match tracking app
- Mobile-first iOS application
- Fast, data-dense, information-focused UI
- Users: Sports fans who want instant score updates, match stats, player info

## Your Mission:
Create a **vibe-coding repository** that allows Product Managers (non-technical) to prototype new features using Claude Code agents without writing code themselves.

## The Goal:
Create a repository structure where:
1. A PM clones the repo
2. A Claude Code agent reads documentation
3. The agent builds iOS feature prototypes using **pre-existing brand components**
4. Features look and feel like authentic Flashscore designs
5. Components are **reused and composed**, but new ones can be created when existing ones don't fit

---

## Design Philosophy

### Brand Identity:
- **Primary Color**: brandRed500 - #FF0046 - high energy, attention-grabbing
- **Secondary Color**: brandSlateBlack500 - #001E28 - trust, stability
- **Typography**: Inter family - modern, readable, clean
- **Visual Style**: Bold, high-contrast, information-dense
- **Patterns**: Card-based layouts without shadows, table layouts with headers with icons instead of text for quick scanability, mobile-optimized

### UI Principles:
1. **Information Density** - Pack data efficiently without clutter
2. **Real-time Focus** - LIVE indicators, time-sensitive data prominent
3. **Quick Scanning** - Users glance, don't read deeply
4. **Consistent Patterns** - Cards for matches, badges for status, clear hierarchy
5. **Mobile-First** - Touch-friendly targets, thumb-reachable actions

### Component Philosophy:
- **Primitives Over Complexity** - 10-15 core components that compose well
- **Reuse First** - Search catalog before creating anything new
- **Composition Over Inheritance** - Build complex UIs by stacking simple pieces
- **Create When Needed** - If existing components don't fit well, create new ones with proper documentation
- **Brand Consistency** - Every component follows token system strictly

---

## Technical Constraints

- **Platform**: iOS 16.0+
- **Framework**: SwiftUI only (no UIKit)
- **Language**: Swift 5.9+
- **Grid System**: 8pt base unit for all spacing
- **Accessibility**: WCAG AA minimum for text contrast
- **Icons**: Custom FlashScore icons in Assets.xcassets (not SF Symbols)
- **No External Dependencies** - Pure SwiftUI

---

## Repository Architecture

### Three-Layer Structure:

**Layer 1: Design Tokens** (Foundation)
- Colors, Typography, Spacing, Shadows
- Manually curated by DesignOps team
- Never modify without designer approval

**Layer 2: Components** (Building Blocks)
- Primitive components: Buttons, Badges, Images, Icons, Action icons
- Specialized components: MatchRow, ParticipantHeader, Odds cells
- All components use Layer 1 tokens exclusively
- Documented with usage examples and visual references
- Custom icons accessed via FSIcon wrapper component

**Layer 3: Features** (Compositions)
- PM-requested prototypes built by Claude Code
- Compose from Layer 2 components
- Use mock data for realistic demonstrations
- Can create new components when composition doesn't fit well

---

## Navigation Structure

The app will have a **TabView with 4 main tabs**:

1. **Matches Tab** - Live scores, match lists, match details
2. **Live Tab** - All live matches today
3. **Favorites Tab** - User preferences over teams, players and favorite matches
4. **Standings Tab** - League tables and rankings

Each tab has its own **NavigationStack** for hierarchical navigation.

---

## Critical Workflow Rules

### Component Decision Process:

1. **Search First** - Check `DesignSystem/Components/_INDEX.md`
2. **Compose Second** - Try combining existing primitives
3. **Create Third** - If existing components require significant modification, create a new one
4. **Document Always** - Include "Component Analysis" comments explaining your choice

### When to CREATE New Components:

✅ **Create new component when:**
- Existing components would need heavy customization
- Pattern will be reused 3+ times
- Composition becomes too complex or unclear
- Has unique internal state/logic

❌ **Don't create new component when:**
- Simple modifier can achieve the goal
- One-off custom layout
- Can be composed from 2-3 existing components cleanly

---

## Custom Icon System

- All FlashScore brand icons live in `Assets.xcassets/Icons/`
- Access via `FSIcon` component wrapper
- Do NOT use SF Symbols (those are marginal/fallback only)

**Usage:**
```swift
FSIcon(name: "icon-matches", size: .medium)
FSIcon(name: "icon-live", size: .small, color: .fsLive)
```

---

## Component Catalog Reference

Before creating any UI, **always check** `DesignSystem/Components/_INDEX.md` to see what's available.

**Common Components:**
- **FSButton** - Primary, secondary, ghost variants
- **FSBadge** - Status indicators (LIVE, FT, HT, etc.)
- **FSMatchCard** - Standard match display
- **FSTeamRow** - Team name + logo + score
- **FSIcon** - Brand icon wrapper

**Common Patterns:**
- Match lists → VStack of FSMatchCard
- Team displays → FSTeamRow
- Status indicators → FSBadge
- Actions → FSButton

---

## Mock Data Guidelines

- Use realistic team names (Premier League, La Liga, etc.)
- Include live scores, finished matches, upcoming matches
- Add timestamps for "starts in X minutes" or "X' minute"
- Include league/competition context
- Make data feel authentic to sports fans

---

## Development Workflow for Claude Code Agents

When a PM requests a feature:

1. **Read PROJECT-CONTEXT.md** (this file)
2. **Check DesignSystem/Components/_INDEX.md** for available components
3. **Plan the composition** - Which components will you reuse?
4. **Build the feature** - Use SwiftUI + existing components
5. **Create new components if needed** - Document them properly
6. **Update _INDEX.md** if you created new components

---

## Example: Building a "Match Detail" Feature

```swift
// ✅ GOOD - Composing existing components
struct MatchDetailView: View {
    var body: some View {
        VStack(spacing: 16) {
            // Reusing FSTeamRow for participants
            FSTeamRow(name: "Arsenal", score: 2, isHome: true)
            FSTeamRow(name: "Chelsea", score: 1, isHome: false)

            // Reusing FSBadge for status
            FSBadge(text: "LIVE", variant: .live)

            // Reusing FSButton for actions
            FSButton(title: "View Stats", style: .secondary)
        }
    }
}
```

```swift
// ❌ BAD - Hardcoding colors, not using components
struct MatchDetailView: View {
    var body: some View {
        Text("Arsenal 2-1 Chelsea")
            .foregroundColor(Color(hex: "#FF0046")) // Don't hardcode!
            .font(.system(size: 18, weight: .bold)) // Use FSTypography!
    }
}
```

---

## Key Success Metrics

A well-built prototype should:
- ✅ Use design tokens exclusively (no hardcoded values)
- ✅ Compose from existing components where possible
- ✅ Feel instantly recognizable as "Flashscore"
- ✅ Work on real iOS devices/simulators
- ✅ Include realistic mock data
- ✅ Be understandable by non-technical PMs
- ✅ Have clear documentation

---

## Questions PMs Might Ask

**"Can I change the brand colors?"**
→ No, those are locked in `DesignSystem/Tokens/`. Ask DesignOps team.

**"Can I create a totally custom component?"**
→ Yes! But check `_INDEX.md` first. If nothing fits, document it well.

**"How do I preview my feature?"**
→ Build and run in Xcode. Features are integrated into the main app tabs.

**"Can I use different fonts?"**
→ No, Inter family is the brand standard. Use `FSTypography` tokens.

---

## Support & Escalation

- **For design questions**: Check `DesignSystem/Documentation/`
- **For component questions**: Check `DesignSystem/Components/_INDEX.md`
- **For technical issues**: Claude Code agents should handle most SwiftUI problems
- **For brand guideline changes**: Contact DesignOps team (tokens are locked)

---

**Last Updated**: 2025-11-06
**Version**: 1.0
**Maintained By**: DesignOps Team
