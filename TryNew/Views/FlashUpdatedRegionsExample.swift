//
//  FlashUpdatedRegionsExample.swift
//  TryNew
//
//  Created for testing Flash Updated Regions feature
//

import SwiftUI

struct FlashUpdatedRegionsExample: View {
    @State private var counter1 = 0
    @State private var counter2 = 0
    @State private var counter3 = 0
    @State private var toggleValue = false
    @State private var textInput = ""
    @State private var sliderValue: Double = 50
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Flash Updated Regions Example")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("Enable 'Flash Updated Regions' in Xcode:\nProduct → Scheme → Edit Scheme → Run → Options → Flash Updated Regions")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                // Counter 1 - Updates only this section
                VStack(spacing: 10) {
                    Text("Counter 1")
                        .font(.headline)
                    Text("\(counter1)")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.blue)
                    Button("Increment") {
                        counter1 += 1
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                
                // Counter 2 - Updates only this section
                VStack(spacing: 10) {
                    Text("Counter 2")
                        .font(.headline)
                    Text("\(counter2)")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.green)
                    Button("Increment") {
                        counter2 += 1
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                
                // Counter 3 - Updates only this section
                VStack(spacing: 10) {
                    Text("Counter 3")
                        .font(.headline)
                    Text("\(counter3)")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.orange)
                    Button("Increment") {
                        counter3 += 1
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                
                // Toggle - Updates this section
                VStack(spacing: 10) {
                    Text("Toggle Switch")
                        .font(.headline)
                    Toggle("Toggle State", isOn: $toggleValue)
                        .labelsHidden()
                    Text(toggleValue ? "ON" : "OFF")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(toggleValue ? .green : .red)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                
                // Text Input - Updates as you type
                VStack(spacing: 10) {
                    Text("Text Input")
                        .font(.headline)
                    TextField("Type something...", text: $textInput)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                    Text("You typed: \(textInput.isEmpty ? "nothing" : textInput)")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                
                // Slider - Updates continuously
                VStack(spacing: 10) {
                    Text("Slider")
                        .font(.headline)
                    Slider(value: $sliderValue, in: 0...100)
                        .padding(.horizontal)
                    Text("Value: \(Int(sliderValue))")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                
                // Button to update all counters at once
                Button("Update All Counters") {
                    counter1 += 1
                    counter2 += 1
                    counter3 += 1
                }
                .buttonStyle(.bordered)
                .padding()
                
                // Computed property that updates
                VStack(spacing: 10) {
                    Text("Computed Sum")
                        .font(.headline)
                    Text("\(counter1 + counter2 + counter3)")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.purple)
                    Text("Sum of all counters")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
            }
            .padding()
        }
    }
}

#Preview {
    FlashUpdatedRegionsExample()
}



