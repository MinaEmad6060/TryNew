//
//  NewMoreTabView.swift
//  TryNew
//
//  Created by Mina Emad on 07/07/2025.
//

import SwiftUI

struct MoreView: View {

    @Environment(\.dismiss) private var dismiss
    private var navigationController: UINavigationController?

    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Hello, More!")
            Button("Push to Last") {
                if let navigationController = navigationController {
                    print("MoreView-navigationController", self.navigationController)
                    LastPushedView(navigationController: navigationController)
                        .push(with: navigationController, animated: true)
                }
            }
            .padding()
            
            Button("Pop To root") {
                self.popToRoot(with: navigationController)
            }
            .padding()
            
            Button("Pop To previous") {
                self.dismiss()
            }
            .padding()
            
            Button("Dismiss To previous") {
                self.dismiss()
            }
            .padding()
            
        }
        
    }
}

