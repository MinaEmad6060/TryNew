// Generated from Figma color variables
import SwiftUI

// MARK: - Color Hex Initializer
extension Color {
    init(hex: String, opacity: Double = 1.0) {
        let hex = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        self.init(
            red: Double((rgbValue >> 16) & 0xFF) / 255.0,
            green: Double((rgbValue >> 8) & 0xFF) / 255.0,
            blue: Double(rgbValue & 0xFF) / 255.0,
            opacity: opacity
        )
    }
}

// MARK: - Design System Colors
extension Color {
    static let color = Color(hex: "#FFFFFF")
}
