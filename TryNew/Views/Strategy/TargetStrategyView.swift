//
//  TargetStrategyView.swift
//  TryNew
//
//  Created by Mina Emad on 12/07/2025.
//

import SwiftUI

struct TargetStrategyView: View {
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss

    private let configuration: ConfiguratorProtocol
    
    // MARK: - Initializer
    init(configuration: ConfiguratorProtocol) {
        self.configuration = configuration
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 48) {
            Text(configuration.pageTitle)
                .font(.title3)
                .fontWeight(.bold)
            
            if let subtitle = configuration.pageSubTitle {
                Text(subtitle)
                    .foregroundStyle(.red)
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
            Button(configuration.buttonTitle) {
                configuration.buttonAction()
            }
            
            Button("Back") {
                self.dismiss()
            }
        }
    }

}

#Preview {
    TargetStrategyView(configuration: ExchangeConfigurator())
}
