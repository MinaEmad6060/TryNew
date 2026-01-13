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
        VStack(spacing: 24) {
            Text("Try Strategy")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            createButton(title: "Exchange", color: .blue) {
                TargetStrategyView(configuration: ExchangeConfigurator())
                    .push(with: navigationController)
            }
            
            createButton(title: "Deliver", color: .green) {
                TargetStrategyView(configuration: DeliverConfigurator())
                    .push(with: navigationController)
            }
            
            createButton(title: "CRP", color: .orange) {
                TargetStrategyView(configuration: CrpConfigurator())
                    .push(with: navigationController)
            }
            
            createButton(title: "Back", color: .gray) {
                self.dismiss()
            }
            
        }
        .padding()
    }
    
    private func createButton(title: String, color: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(color)
                .cornerRadius(12)
                .shadow(color: color.opacity(0.3), radius: 5, x: 0, y: 3)
        }
    }
}

#Preview {
    MainStrategyView()
}
