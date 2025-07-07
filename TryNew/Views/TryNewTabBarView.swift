//
//  TryNewTabBarView.swift
//  TryNew
//
//  Created by Mina Emad on 07/07/2025.
//

import SwiftUI
import NavigationLayer

struct TryNewTabBarView: View {
    var body: some View {
        MainTabBarView(mainTabsView:
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                FavouriteView()
                    .tabItem {
                        Label("Favourite", systemImage: "star")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                MoreView()
                    .tabItem {
                        Label("More", systemImage: "ellipsis")
                    }
            }
        )
        .ignoresSafeArea()
    }
}

#Preview {
    TryNewTabBarView()
}
