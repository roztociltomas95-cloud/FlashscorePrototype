//
//  FSDateCarousel.swift
//  FlashscorePrototype
//
//  Component: Horizontal date selector carousel
//  Category: Composed
//

import SwiftUI

/// FlashScore date carousel component
/// Displays scrollable horizontal list of dates with today highlighted
struct FSDateCarousel: View {

    // MARK: - Properties

    @State private var selectedDate: Date = Date()
    private let dates: [DateItem]

    // MARK: - Initialization

    init() {
        // Generate 7 days (3 before, today, 3 after)
        let calendar = Calendar.current
        let today = Date()

        var dateItems: [DateItem] = []
        for offset in -3...3 {
            if let date = calendar.date(byAdding: .day, value: offset, to: today) {
                dateItems.append(DateItem(date: date, isToday: offset == 0))
            }
        }

        self.dates = dateItems
    }

    // MARK: - Body

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: FSSpacing.sm24) {
                ForEach(dates) { dateItem in
                    DateCell(
                        dateItem: dateItem,
                        isSelected: Calendar.current.isDate(dateItem.date, inSameDayAs: selectedDate)
                    ) {
                        selectedDate = dateItem.date
                    }
                }
            }
            .padding(.horizontal, FSSpacing.xs16)
            .padding(.vertical, FSSpacing.xxs8)
        }
        .background(Color.white)
    }
}

// MARK: - Date Cell

private struct DateCell: View {
    let dateItem: DateItem
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        VStack(spacing: FSSpacing.xxxs4) {
            Text(dateItem.weekdayShort)
                .font(.labelMBold)
                .foregroundColor(dateItem.isToday ? .brandRed500 : .greyC500)

            Text(dateItem.dayNumber)
                .font(.bodyMBold)
                .foregroundColor(dateItem.isToday ? .brandRed500 : .brandSlateBlack500)

            if dateItem.isToday {
                Rectangle()
                    .fill(Color.brandRed500)
                    .frame(width: 32, height: 3)
            }
        }
        .frame(width: 48)
        .contentShape(Rectangle())
        .onTapGesture(perform: onTap)
    }
}

// MARK: - Date Item

private struct DateItem: Identifiable {
    let id = UUID()
    let date: Date
    let isToday: Bool

    var weekdayShort: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: date).uppercased()
    }

    var dayNumber: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d.M."
        return formatter.string(from: date)
    }
}

// MARK: - Preview

#Preview("Date Carousel") {
    VStack(spacing: 0) {
        FSDateCarousel()
        Spacer()
    }
}
