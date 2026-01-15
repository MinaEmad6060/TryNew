//
//  MainStrategyView.swift
//  TryNew
//
//  Created by Mina Emad on 12/07/2025.
//

import SwiftUI

struct MainStrategyView: View {
    @Environment(\.dismiss) private var dismiss
    private var navigationController: UINavigationController?

    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    var body: some View {
        VStack(spacing: 48) {
            Text("Try Strategy")
                .font(.title3)
                .fontWeight(.bold)
            
            createButton(title: "Exchange") {
                TargetStrategyView(configuration: ExchangeConfigurator())
                    .push(with: navigationController)
            }
            
            createButton(title: "Deliver") {
                TargetStrategyView(configuration: DeliverConfigurator())
                    .push(with: navigationController)
            }
            
            createButton(title: "CRP") {
                TargetStrategyView(configuration: CrpConfigurator())
                    .push(with: navigationController)
            }
            
            createButton(title: "Back") {
                self.dismiss()
            }
            
        }
    }
    
    private func createButton(title: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    MainStrategyView()
}
