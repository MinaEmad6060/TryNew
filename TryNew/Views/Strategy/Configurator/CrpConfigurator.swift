//
//  CrpConfigurator.swift
//  TryNew
//
//  Created by Mina Emad on 12/07/2025.
//

final class CrpConfigurator: ConfiguratorProtocol {
    
    var pageTitle: String = "CRP Title"
    
    var pageSubTitle: String? = "CRP Subtitle"

    var buttonTitle: String = "CRP Button"
    
    var buttonAction: () -> Void = { }
    
    init() {
        buttonAction = { self.showNativeAlert(title: "CRP Note", message: "You should mark this shipment to CRP", mainAction: "Sure") }
    }
   

}
