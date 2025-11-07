//
//  Spacing.swift
//  DesignSystem
//
//  Created on [Date]
//

import Foundation

/// Design System Spacing
/// Uses a 2x spacing scale (base unit = 8pt)
public enum FSSpacing {
    
    // MARK: - Base Unit
    
    /// Base spacing unit (8pt)
    private static let baseUnit: CGFloat = 8.0
    
    // MARK: - Spacing Scale (2x)
    
    /// 0pt - No spacing
    public static let none: CGFloat = 0
    
    /// 4pt - Half of base unit
    public static let xxxs4: CGFloat = baseUnit * 0.5  // 4
    
    /// 8pt - Base unit
    public static let xxs8: CGFloat = baseUnit * 1    // 8
    
    /// 16pt - 2x base unit
    public static let xs16: CGFloat = baseUnit * 2     // 16
    
    /// 24pt - 3x base unit
    public static let sm24: CGFloat = baseUnit * 3     // 24
    
    /// 32pt - 4x base unit
    public static let md32: CGFloat = baseUnit * 4     // 32
    
    /// 40pt - 5x base unit
    public static let lg: CGFloat = baseUnit * 5     // 40
    
    /// 48pt - 6x base unit
    public static let xl: CGFloat = baseUnit * 6     // 48
 
    
    // MARK: - Custom Multiplier
    
    /// Returns spacing value for custom multiplier
    /// - Parameter multiplier: Multiplier of base unit
    /// - Returns: Spacing value
    public static func custom(_ multiplier: CGFloat) -> CGFloat {
        return baseUnit * multiplier
    }
}

// MARK: - Semantic Spacing

public extension FSSpacing {
    
    /// Padding values for common use cases
    enum Padding {
        /// 4pt - Minimal padding
        public static let minimal = FSSpacing.xxxs4
        
        /// 8pt - Small padding
        public static let small = FSSpacing.xxs8
        
        /// 16pt - Default padding
        public static let `default` = FSSpacing.xs16
        
        /// 24pt - Medium padding
        public static let medium = FSSpacing.sm24
        
        /// 32pt - Large padding
        public static let large = FSSpacing.md32
        
        /// 48pt - Extra large padding
        public static let extraLarge = FSSpacing.xl
    }
    
    /// Margin values for common use cases
    enum Margin {
        /// 8pt - Small margin
        public static let small = FSSpacing.xxs8
        
        /// 16pt - Default margin
        public static let `default` = FSSpacing.xs16
        
        /// 24pt - Medium margin
        public static let medium = FSSpacing.sm24
        
        /// 32pt - Large margin
        public static let large = FSSpacing.md32
    }
    
    /// Gap values for stacks and grids
    enum Gap {
        /// 4pt - Tight gap
        public static let tight = FSSpacing.xxxs4
        
        /// 8pt - Small gap
        public static let small = FSSpacing.xxs8
        
        /// 16pt - Default gap
        public static let `default` = FSSpacing.xs16
        
        /// 24pt - Medium gap
        public static let medium = FSSpacing.sm24
        
        /// 32pt - Large gap
        public static let large = FSSpacing.md32
    }
}

// MARK: - UIEdgeInsets Extension

public extension FSSpacing {
    
    /// Creates UIEdgeInsets with equal spacing on all sides
    static func insets(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
    
    /// Creates UIEdgeInsets with horizontal and vertical spacing
    static func insets(horizontal: CGFloat, vertical: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    /// Creates UIEdgeInsets with custom spacing for each side
    static func insets(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: leading, bottom: bottom, right: trailing)
    }
}

// MARK: - SwiftUI EdgeInsets Extension

#if canImport(SwiftUI)
import SwiftUI

public extension FSSpacing {
    
    /// Creates SwiftUI EdgeInsets with equal spacing on all sides
    static func edgeInsets(_ value: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: value, leading: value, bottom: value, trailing: value)
    }
    
    /// Creates SwiftUI EdgeInsets with horizontal and vertical spacing
    static func edgeInsets(horizontal: CGFloat, vertical: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
    
    /// Creates SwiftUI EdgeInsets with custom spacing for each side
    static func edgeInsets(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
}
#endif
