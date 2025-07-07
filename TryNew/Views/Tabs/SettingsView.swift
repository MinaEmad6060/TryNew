//
//  SettingsView.swift
//  TryNew
//
//  Created by Mina Emad on 25/06/2025.
//

import SwiftUI
import NavigationLayer

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    private var navigationController: UINavigationController?

    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Hello, Settings!")
            Button("Pop To Root") {
                self.popToRoot(with: navigationController)
            }
            .padding()
            
            Button("Pop To previous") {
                self.dismiss()
            }
            .padding()
            
            Button("Pop (Specific) to More") {
                self.popToSpecificScreen(with: navigationController, ofType: MoreView.self)
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
