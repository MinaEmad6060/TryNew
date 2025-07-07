//
//  HomeView.swift
//  TryNew
//
//  Created by Mina Emad on 25/06/2025.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.navigationController) private var navigationController

    var body: some View {
        VStack {
            Text("Hello, Home!")
            Button("Push to More") {
                print("HomeView-navigationController", navigationController)
                MoreView(navigationController: navigationController)
                    .push(with: navigationController)
            }
            .padding()
            
            
            Button("Present to More") {
                MoreView(navigationController: navigationController)
                    .present(with: navigationController)
            }
            .padding()
        
        }
    }
    
}

#Preview {
    HomeView()
}

