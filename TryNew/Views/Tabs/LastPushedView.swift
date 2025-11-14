//
//  LastPushedView.swift
//  TryNew
//
//  Created by Mina Emad on 07/07/2025.
//

import SwiftUI

struct LastPushedView: View {
    
    @Environment(\.dismiss) private var dismiss
    private var navigationController: UINavigationController?

    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text("Hello, Last!")
                ZStack {
                    // Base red background
                    ContainerRelativeShape()
                        .fill(Color.red)
                    
                    // Gradient overlay (top → center)
                    ContainerRelativeShape()
                        .fill(
                            LinearGradient(
                                colors: [.white, .clear],
                                startPoint: .leading,
                                endPoint: .center
                            )
                        )
                    
//                    // White border + shadow
//                    ContainerRelativeShape()
//                        .strokeBorder(Color.white, lineWidth: 2)
//                        .shadow(radius: 2)
                }
                .frame(height: 200)

                Text(3000, format: .number)
                

            }
        }
    }
}

#Preview {
    ContentView3()
}

struct ContentView3: View {
    @State private var flag = false
    var body: some View {
        Rectangle()
            .frame(width: flag ? 100 : 50, height: flag ? 100 : 50)
            .onTapGesture {
                withAnimation(.bouncy(duration: 3.0)) { flag.toggle() }
            }
    }
}


import SwiftUI
import Observation

@Observable
final class UserModel {
    var name: String = "John Doe"
}

struct Nested: View {
    @Environment(UserModel.self) private var userModel

    var body: some View {
        Text(userModel.name)
    }
}

struct ContentView2: View {
    private let userModel = UserModel()

    var body: some View {
        Nested()
            .padding()
            .environment(userModel)
    }
}
