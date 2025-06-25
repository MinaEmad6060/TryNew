//
//  MoreView.swift
//  TryNew
//
//  Created by Mina Emad on 25/06/2025.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        Text("Hello, More!")
        Button("Pop To Home") {
            NavigationManager.shared.pop()
        }
        .padding()
        
        Button("Dismiss To Home") {
            NavigationManager.shared.dismiss()
        }
        .padding()
    }
}

#Preview {
    MoreView()
}
