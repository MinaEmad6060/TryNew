//
//  NavigationLogic.swift
//  TryNew
//
//  Created by Mina Emad on 25/06/2025.
//

import SwiftUI

struct MainTabBarView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let tabBarController = MainTabBarController()
        let navigationController = UINavigationController(rootViewController: tabBarController)
        navigationController.navigationBar.isHidden = true
        NavigationManager.shared.navigationController = navigationController // <-- Add this line
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // No update logic needed for now
    }
}

