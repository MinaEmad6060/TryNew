//
//  DeliverConfigurator.swift
//  TryNew
//
//  Created by Mina Emad on 12/07/2025.
//

@MainActor
final class DeliverConfigurator: ConfiguratorProtocol {
    
    var pageTitle: String = "Deliver Title"
    
    var pageSubTitle: String? = nil

    var buttonTitle: String = "Deliver Button"
    
    var buttonAction: () -> Void = { }
    
    init() {
        buttonAction = {
            Task { @MainActor in
                self.showNativeAlert(title: "Deliver Note", message: "You should Deliver this shipment as quick as possible", mainAction: "Yes, for sure")
            }
        }
    }
   

}
