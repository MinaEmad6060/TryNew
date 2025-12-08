//
//  ScrollViewBackgroundExample.swift
//  TryNew
//
//  Created for testing scrollContentBackground modifier
//

import SwiftUI

struct ScrollViewBackgroundExample: View {
    @State private var backgroundVisibility: Visibility = .visible
    @State private var selectedColor: Color = .blue
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Control Panel
                VStack(spacing: 15) {
                    Text("ScrollView Background Visibility")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Picker("Background", selection: $backgroundVisibility) {
                        Text("Visible").tag(Visibility.visible)
                        Text("Hidden").tag(Visibility.hidden)
                        Text("Automatic").tag(Visibility.automatic)
                    }
                    .pickerStyle(.segmented)
                    
                    ColorPicker("Background Color", selection: $selectedColor)
                        .padding(.horizontal)
                }
                .padding()
                .background(Color(.systemBackground))
                
                Divider()
                
                // ScrollView with configurable background
                ScrollView {
                    VStack(spacing: 20) {
                        // Header
                        VStack(spacing: 10) {
                            Text("ScrollView Content")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            Text("Current setting: \(backgroundVisibility == .visible ? "Visible" : backgroundVisibility == .hidden ? "Hidden" : "Automatic")")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.top, 20)
                        
                        // Content cards
                        ForEach(1...20, id: \.self) { index in
                            CardView(number: index, color: selectedColor)
                        }
                    }
                    .padding()
                }
                .scrollContentBackground(backgroundVisibility)
                .background(selectedColor.opacity(0.3))
            }
            .navigationTitle("ScrollView Background")
        }
    }
}

struct CardView: View {
    let number: Int
    let color: Color
    
    var body: some View {
        HStack {
            Circle()
                .fill(color)
                .frame(width: 50, height: 50)
                .overlay(
                    Text("\(number)")
                        .font(.headline)
                        .foregroundColor(.white)
                )
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Card \(number)")
                    .font(.headline)
                Text("This is card number \(number) in the scroll view")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

// Alternative example showing side-by-side comparison
struct ScrollViewBackgroundComparison: View {
    var body: some View {
        HStack(spacing: 0) {
            // ScrollView with visible background
            VStack {
                Text("Visible Background")
                    .font(.headline)
                    .padding()
                
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(1...10, id: \.self) { index in
                            Text("Item \(index)")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                }
                .scrollContentBackground(.visible)
                .background(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            }
            .frame(maxWidth: .infinity)
            
            Divider()
            
            // ScrollView with hidden background
            VStack {
                Text("Hidden Background")
                    .font(.headline)
                    .padding()
                
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(1...10, id: \.self) { index in
                            Text("Item \(index)")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                }
                .scrollContentBackground(.hidden)
                .background(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            }
            .frame(maxWidth: .infinity)
        }
    }
}

// Simple example with just visible background
struct SimpleScrollViewExample: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Text("Row \(index + 1)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .scrollContentBackground(.visible)
        .background(
            LinearGradient(
                colors: [.orange, .pink, .purple],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

#Preview("Main Example") {
    ScrollViewBackgroundExample()
}

#Preview("Comparison") {
    ScrollViewBackgroundComparison()
}

#Preview("Simple Example") {
    SimpleScrollViewExample()
}

