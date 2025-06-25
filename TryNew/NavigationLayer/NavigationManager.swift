//
//  NavigationManager.swift
//  TryNew
//
//  Created by Mina Emad on 25/06/2025.
//

import UIKit
import SwiftUI

class NavigationManager {
    static let shared = NavigationManager()
    private init() {}

    weak var navigationController: UINavigationController?

    func push<Content: View>(_ swiftUIView: Content, animated: Bool = true) {
        let viewController = NavigationManager.convertToUIViewController(swiftUIView)
        navigationController?.pushViewController(viewController, animated: animated)
    }

    func present<Content: View>(_ swiftUIView: Content, animated: Bool = true, completion: (() -> Void)? = nil) {
        let viewController = NavigationManager.convertToUIViewController(swiftUIView)
        navigationController?.present(viewController, animated: animated, completion: completion)
    }

    func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }

    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController?.dismiss(animated: animated, completion: completion)
    }

    static func convertToUIViewController<Content: View>(_ swiftUIView: Content) -> UIViewController {
        return UIHostingController(rootView: swiftUIView)
    }
}
