//
//  HomeView.swift
//  TryNew
//
//  Created by Mina Emad on 25/06/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Hello, Home!")
            Button("Push to More") {
                NavigationManager.shared.push(MoreView())
            }
            .padding()
            
            Button("Present to More") {
                NavigationManager.shared.present(MoreView())
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}

