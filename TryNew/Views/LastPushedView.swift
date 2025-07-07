//
//  LastPushedView.swift
//  TryNew
//
//  Created by Mina Emad on 07/07/2025.
//

import SwiftUI

struct LastPushedView: View {
    
    @Environment(\.dismiss) private var dismiss
    private var navigationController: UINavigationController?

    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    var body: some View {
        Text("Hello, Last!")
        Button("Push to Settings") {
            if let navigationController = navigationController {
                print("LastPushedView-navigationController", self.navigationController)
                SettingsView(navigationController: navigationController)
                    .push(with: navigationController)
            }
        }
        .padding()
        
        Button("Pop To previous") {
            self.dismiss()
        }
        .padding()
    }
}

#Preview {
    LastPushedView()
}
