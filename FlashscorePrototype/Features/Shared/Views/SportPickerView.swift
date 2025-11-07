//
//  SportPickerView.swift
//  FlashscorePrototype
//
//  Modal: Sport picker for switching between sports
//

import SwiftUI

struct SportPickerView: View {
    @Binding var selectedSport: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 0) {
                        // Popular sports section
                        SectionHeader(title: "POPULAR SPORTS")

                        VStack(spacing: 0) {
                            ForEach(MockSportsData.popularSports) { sport in
                                SportRow(
                                    sport: sport,
                                    isSelected: selectedSport == sport.name,
                                    onTap: {
                                        selectedSport = sport.name
                                        dismiss()
                                    }
                                )

                                if sport.id != MockSportsData.popularSports.last?.id {
                                    Divider()
                                        .padding(.leading, 72)
                                }
                            }
                        }

                        // Other sports section
                        SectionHeader(title: "OTHER SPORTS [A-Z]")
                            .padding(.top, FSSpacing.xxxs4)

                        VStack(spacing: 0) {
                            ForEach(MockSportsData.otherSports) { sport in
                                SportRow(
                                    sport: sport,
                                    isSelected: selectedSport == sport.name,
                                    onTap: {
                                        selectedSport = sport.name
                                        dismiss()
                                    }
                                )

                                if sport.id != MockSportsData.otherSports.last?.id {
                                    Divider()
                                        .padding(.leading, 72)
                                }
                            }
                        }

                        // Bottom spacing
                        Color.clear.frame(height: FSSpacing.xxs8)
                    }
                }
            }
            .navigationTitle("Select sport")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.brandSlateBlack500)
                    }
                }
            }
        }
    }
}

// MARK: - Section Header

private struct SectionHeader: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.labelMBold)
            .foregroundColor(.greyC500)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, FSSpacing.xs16)
            .padding(.vertical, FSSpacing.xxs8)
            .background(Color.greyA200)
    }
}

// MARK: - Sport Row

private struct SportRow: View {
    let sport: Sport
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: FSSpacing.xxs8) {
                // Sport icon
                Image(sport.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.brandSlateBlack500)
                    .frame(width: 24, height: 24)

                // Sport name and subtitle
                VStack(alignment: .leading, spacing: FSSpacing.xxxs4) {
                    Text(sport.name)
                        .font(.bodyMBold)
                        .foregroundColor(.brandSlateBlack500)

                    if let subtitle = sport.subtitle {
                        Text(subtitle)
                            .font(.labelMRegular)
                            .foregroundColor(.greyC500)
                    }
                }

                Spacer()

                // Live count badge
                if let liveCount = sport.liveCount {
                    Text("\(liveCount)")
                        .font(.bodyMBold)
                        .foregroundColor(.white)
                        .padding(.horizontal, FSSpacing.xxs8)
                        .padding(.vertical, 4)
                        .background(Color.brandRed500)
                        .cornerRadius(4)
                }

                // Total count
                Text("\(sport.totalCount)")
                    .font(.bodyMBold)
                    .foregroundColor(isSelected ? .brandSlateBlack500 : .greyC500)
                    .frame(minWidth: 32)
            }
            .padding(.horizontal, FSSpacing.xs16)
            .padding(.vertical, FSSpacing.xs16)
            .background(isSelected ? Color.greyA200 : Color.white)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Preview

#Preview {
    @Previewable @State var selectedSport = "Football"

    SportPickerView(selectedSport: $selectedSport)
}
