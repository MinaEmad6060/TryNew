//
//  Animation.swift
//  TryNew
//
//  Created by Mina Emad on 20/08/2025.
//


import SwiftUI

struct AnimationView: View {
    @State private var flag = false

    var body: some View {
        Rectangle()
            .modifier(FancyAnimationModifier(progress: flag ? 1 : 0))
            .onTapGesture {
                withAnimation(.linear(duration: 2.0)) {
                    flag.toggle()
                }
            }
    }
}

#Preview {
    AnimationView()
}

// Step 1: Create a custom AnimatableModifier
// This allows you to apply the animation to any view and its animatable properties.
struct FancyAnimationModifier: @preconcurrency AnimatableModifier {
    var progress: CGFloat

    // The animatableData is the key part. SwiftUI will automatically
    // interpolate this value for you.
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }

    func body(content: Content) -> some View {
        // Step 2: Define your custom animation curve here
        // The 'progress' value is what's being animated from 0 to 1
        let eased = sin(progress * .pi * 0.5)
        let bounce = eased + (0.08 * sin(progress * 8 * .pi))

        // Step 3: Apply the animation to the view's properties
        // We use the 'bounce' value to control the interpolation.
        content
            .frame(width: 60 + 60 * bounce, height: 60 + 60 * bounce)
            .cornerRadius(10 + 20 * bounce)
            .shadow(radius: 5 + 15 * bounce)
            .foregroundColor(Color.blue.mix(with: Color.purple, amount: bounce))
    }
}


// Helper function for color mixing, as it's not a built-in SwiftUI feature
extension Color {
    func mix(with other: Color, amount: CGFloat) -> Color {
        let amount = min(max(amount, 0), 1)
        var (r1, g1, b1, a1) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        var (r2, g2, b2, a2) = (CGFloat(0), CGFloat(0), CGFloat(0), CGFloat(0))
        
        // This extension works for both UIColor and NSColor, so we handle both
        #if canImport(UIKit)
        UIColor(self).getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        UIColor(other).getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        #elseif canImport(AppKit)
        NSColor(self).getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        NSColor(other).getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        #endif

        return Color(red: r1 + (r2 - r1) * amount,
                     green: g1 + (g2 - g1) * amount,
                     blue: b1 + (b2 - b1) * amount,
                     opacity: a1 + (a2 - a1) * amount)
    }
}

