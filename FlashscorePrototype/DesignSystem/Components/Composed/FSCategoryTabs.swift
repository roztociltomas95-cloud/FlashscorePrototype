//
//  FSCategoryTabs.swift
//  FlashscorePrototype
//
//  Horizontal scrollable category tabs for filtering content
//

import SwiftUI

struct FSCategoryTabs: View {
    let categories: [NewsCategory]
    @Binding var selectedCategory: NewsCategory

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: FSSpacing.xs16) {
                ForEach(categories, id: \.self) { category in
                    CategoryTab(
                        title: category.displayName,
                        isSelected: selectedCategory == category,
                        onTap: {
                            selectedCategory = category
                        }
                    )
                }
            }
            .padding(.horizontal, FSSpacing.xs16)
        }
        .background(Color.white)
    }
}

private struct CategoryTab: View {
    let title: String
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            Text(title)
                .font(.labelMBold)
                .foregroundColor(isSelected ? .brandRed500 : .greyC500)
                .padding(.horizontal, FSSpacing.xs16)
                .padding(.vertical, FSSpacing.xxs8)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(isSelected ? Color.brandRed50 : Color.greyA200)
                )
        }
    }
}

#Preview {
    @Previewable @State var selectedCategory: NewsCategory = .all

    VStack {
        FSCategoryTabs(
            categories: NewsCategory.allCases,
            selectedCategory: $selectedCategory
        )

        Text("Selected: \(selectedCategory.displayName)")
            .padding()
    }
}
