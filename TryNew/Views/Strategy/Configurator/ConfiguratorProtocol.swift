//
//  ConfiguratorProtocol.swift
//  TryNew
//
//  Created by Mina Emad on 12/07/2025.
//

import UIKit

@MainActor
protocol ConfiguratorProtocol {
    var pageTitle: String { get }
    var pageSubTitle: String? { get }
    var buttonTitle: String { get }
    var buttonAction: () -> Void { get }
}


extension ConfiguratorProtocol {
    var buttonAction: () -> Void {
        return {
            print("Default button action executed.")
        }
    }
}
    
extension ConfiguratorProtocol {
    
    @MainActor
    func showNativeAlert(
        title: String,
        message: String,
        mainAction: String,
        secondaryAction: String? = nil,
        mainActionHandler: (() -> Void)? = nil,
        secondaryActionHandler: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        // Main Action (Default)
        alert.addAction(UIAlertAction(title: mainAction, style: .default) { _ in
            mainActionHandler?()
        })
        
        // Optional Secondary Action (Destructive or Cancel)
        if let secondaryTitle = secondaryAction, !secondaryTitle.isEmpty {
            alert.addAction(UIAlertAction(title: secondaryTitle, style: .destructive) { _ in
                secondaryActionHandler?()
            })
        }
        
        // Present the alert
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let root = scene.windows.first(where: { $0.isKeyWindow })?.rootViewController {
            root.present(alert, animated: true)
        }
    }

}
