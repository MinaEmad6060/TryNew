//
//  ExchangeConfigurator.swift
//  TryNew
//
//  Created by Mina Emad on 12/07/2025.
//

import UIKit

@MainActor
final class ExchangeConfigurator: ConfiguratorProtocol {
    
    var pageTitle: String = "Exchange Title"
    
    var pageSubTitle: String? = nil

    var buttonTitle: String = "Exchange Button"
    
    var buttonAction: () -> Void = { }
    
    init() {
        buttonAction = {
            Task { @MainActor in
                self.showNativeAlert(title: "Exchange Note", message: "You should exchange your shipment", mainAction: "OK")
            }
        }
    }
   
}

