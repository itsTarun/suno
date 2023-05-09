//  AppTabBarView.swift

import SwiftUI

// Generics
// ViewBuilder
// PreferenceKey
// MatchedGeometryEffect

struct AppTabBarView: View {
    @State private var selection = "Home"
    @State private var tabSelection: TabBarItem = .home
    @EnvironmentObject var dataManager: DataManager
    
    @State var miniPlayerExpand = false
    @Namespace var animation
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            CustomTabBarContainerView(selection: $tabSelection) {
                
                ListView()
                   .environmentObject(dataManager)
                    .tabBarItem(tab: .home, selection: $tabSelection)
                
                Color.cyan
                    .tabBarItem(tab: .search, selection: $tabSelection)
                
                Color.blue
                    .tabBarItem(tab: .favorites, selection: $tabSelection)
                
                Color.green
                    .tabBarItem(tab: .profile, selection: $tabSelection)
            }
            // PlayerView
            PlayerView(
                expand: $miniPlayerExpand, animation: animation
            )
        }
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBarView()
            .environmentObject(DataManager())
    }
}
