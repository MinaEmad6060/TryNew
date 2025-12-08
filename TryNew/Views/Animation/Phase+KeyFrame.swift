//
//  Phase+KeyFrame.swift
//  TryNew
//
//  Created by Mina Emad on 20/08/2025.
//

import SwiftUI

// MARK: - Phase Animator Example
struct PhaseExample: View {
    enum PulsePhase: CaseIterable {
        case small, big
    }
    
    var body: some View {
        Circle()
            .fill(.teal)
            .frame(width: 100, height: 100)
            .phaseAnimator(PulsePhase.allCases, content: { content, phase in
                content
                    .scaleEffect(phase == .small ? 1.0 : 1.5)
                    .opacity(phase == .small ? 0.6 : 1.0)
            }, animation: { phase in
                switch phase {
                case .small:
                    return .easeInOut(duration: 1.0)
                case .big:
                    return .spring(duration: 1.0, bounce: 0.5)
                }
            })
    }
}

//#Preview {
//    PhaseExample()
//}

// MARK: - Basic Animation Example
struct BasicAnimationExample: View {
    @State private var flag = false
    
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: flag ? 50 : 100, height: 50)
                .animation(.default, value: flag)
                .onTapGesture {
                    flag.toggle()
                }
        }
    }
}

//#Preview {
//    BasicAnimationExample()
//}

// MARK: - Shake Animation Example
struct ShakeAnimationExample: View {
    @State private var flag = false
    @State private var shakes = 0.0
    
    var body: some View {
        VStack(spacing: 40) {
            Rectangle()
                .fill(.teal)
                .frame(width: flag ? 50 : 100, height: 50)
                .shake(with: shakes)
                .onTapGesture {
                    withAnimation(.default) {
                        flag.toggle()
                        shakes += 1  // trigger shake animation
                    }
                }
            
            Text("Tap rectangle to shake")
                .font(.headline)
                .foregroundStyle(.gray)
        }
        .padding()
    }
}

//#Preview {
//    ShakeAnimationExample()
//}

// MARK: - Phase Animator with Trigger Example
struct PhaseAnimatorTriggerExample: View {
    @State private var shakes = 0
    
    var body: some View {
        Button("Shake") {
            shakes += 1
        }
        .phaseAnimator([0, -20, 20], trigger: shakes) { content, offset in
            content.offset(x: offset)
        }
    }
}

//#Preview {
//    PhaseAnimatorTriggerExample()
//}

// MARK: - Custom Shake Modifier
struct Shake: ViewModifier, @preconcurrency Animatable {
    var numberOfShakes: Double
    
    var animatableData: Double {
        get { numberOfShakes }
        set { numberOfShakes = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .offset(x: -sin(numberOfShakes * 2 * .pi) * 30)
    }
}

extension View {
    func shake(with shakes: Double) -> some View {
        self.modifier(Shake(numberOfShakes: shakes))
    }
}

// MARK: - Custom Blur Transition
struct Blur: ViewModifier {
    var radius: CGFloat
    func body(content: Content) -> some View {
        content
            .blur(radius: radius)
    }
}

extension AnyTransition {
    static func blur(radius: CGFloat) -> Self {
        .modifier(
            active: Blur(radius: 100),
            identity: Blur(radius: 0)
        )
    }
}


// MARK: - KeyFrame
struct ShakeSample: View {
    @State private var trigger = 0
    var body: some View {
        Button("Shake") {
            trigger += 1
        }
        .keyframeAnimator(initialValue: 0, trigger: trigger) { content, offset in
            content.offset(x: offset)
        } keyframes: { _ in
            CubicKeyframe(-30, duration: 0.25)
            CubicKeyframe(30, duration: 0.5)
            CubicKeyframe(0, duration: 0.25)
        }
    }
}
//
//#Preview {
//    ShakeSample()
//}


// MARK: - ShakeData struct for complex animations
struct ShakeData: Equatable, @preconcurrency Animatable {
    var offset: CGFloat = 0
    var rotation: Angle = .zero
    
    var animatableData: AnimatablePair<CGFloat, Double> {
        get { AnimatablePair(offset, rotation.radians) }
        set { 
            offset = newValue.first
            rotation = .radians(newValue.second)
        }
    }
}

struct ShakeSample2: View {
    @State private var trigger = 0
    var body: some View {
        Button("Shake") {
            trigger += 1
        }
        .keyframeAnimator(initialValue: ShakeData(), trigger: trigger) { content, data in
            content
                .offset(x: data.offset)
                .rotationEffect(data.rotation)
        } keyframes: { value in
            CubicKeyframe(ShakeData(offset: -30, rotation: .degrees(-5)), duration: 0.1)
            CubicKeyframe(ShakeData(offset: 30, rotation: .degrees(5)), duration: 0.2)
            CubicKeyframe(ShakeData(offset: -20, rotation: .degrees(-3)), duration: 0.15)
            CubicKeyframe(ShakeData(offset: 20, rotation: .degrees(3)), duration: 0.15)
            CubicKeyframe(ShakeData(offset: -10, rotation: .degrees(-1)), duration: 0.1)
            CubicKeyframe(ShakeData(offset: 10, rotation: .degrees(1)), duration: 0.1)
            CubicKeyframe(ShakeData(offset: 0, rotation: .zero), duration: 0.2)
        }
    }
}


#Preview {
    ShakeSample2()
}
