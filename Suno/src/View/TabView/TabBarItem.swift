//  TabBarItem.swift

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case home, search, favorites, profile
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .search: return "magnifyingglass"
        case .favorites: return "heart"
        case .profile: return "person"
        }
    }
    var title: String {
        switch self {
        case .home: return "Home"
        case .search: return "Search"
        case .favorites: return "Favorites"
        case .profile: return "Profile"
            
        }
    }
    var color: Color {
        switch self {
        case .home: return .red
        case .search: return .cyan
        case .favorites: return .blue
        case .profile: return .green
        }
    }
}

//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}
