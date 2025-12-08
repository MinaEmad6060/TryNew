//
//  TestPreferences.swift
//  TryNew
//
//  Created by Mina Emad on 14/11/2025.
//

import SwiftUI

struct TestPreferences: View {
    var body: some View {
//        ZStack(alignment: .topLeading) {
        VStack(spacing: 8) {
            ForEach(0..<5) { ix in
                Text("Item \(ix)" + String(repeating: "\n", count: ix/2))
                    .padding()
                    .measureSize()
            }
        }
        .onPreferenceChange(SizeKey.self) { print($0) }
    }
}

#Preview {
    TestPreferences()
}


extension View {
    func measureSize() -> some View {
        overlay {
            GeometryReader { proxy in
                Color.clear
                    .preference(key: SizeKey.self, value: [proxy.size])
            }
        }
    }
}

struct SizeKey: PreferenceKey {
    static let defaultValue: [CGSize] = []
    static func reduce(value: inout [CGSize], nextValue: () -> [CGSize]) {
        value.append(contentsOf: nextValue())
    }
}
