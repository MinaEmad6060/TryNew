//
//  TryNewTabBarView.swift
//  TryNew
//
//  Created by Mina Emad on 07/07/2025.
//

import SwiftUI
import NavigationLayer

//struct TryNewTabBarView: View {
//    var body: some View {
//        MainTabBarView(mainTabsView:
//            TabView {
//                HomeView()
//                    .tabItem {
//                        Label("Home", systemImage: "house")
//                    }
//                FavouriteView()
//                    .tabItem {
//                        Label("Favourite", systemImage: "star")
//                    }
//                SettingsView()
//                    .tabItem {
//                        Label("Settings", systemImage: "gear")
//                    }
//                MoreView()
//                    .tabItem {
//                        Label("More", systemImage: "ellipsis")
//                    }
//            }
//        )
//        .ignoresSafeArea()
//    }
//}
//
//#Preview {
//    TryNewTabBarView()
//}

struct ContentView: View {
    @Namespace private var animation
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            if isExpanded {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .frame(height: 300)
                    .matchedGeometryEffect(id: "shape", in: animation)
                    .padding()
            } else {
                HStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .frame(width: 50, height: 50)
                        .matchedGeometryEffect(id: "shape", in: animation)
                        .padding()
                }
            }
            
            Button("Toggle") {
                withAnimation(.spring()) {
                    isExpanded.toggle()
                }
            }
        }
    }
}
//
//#Preview {
//    ContentView()
//}

struct NamespaceExample: View {
    @State private var first = true
    @Namespace private var id
    
    var body: some View {
        Color(uiColor: first ? .red : .blue)
            .onAppear {
                print("View appear \(id)")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    first.toggle()
                }
            }
            .onDisappear {
                print("View disappear \(id)")
            }
            .id(first)
    }
}
//
//#Preview {
//    NamespaceExample()
//}
