//
//  Home.swift
//  Suno
//
//  Created by Tarun on 03/04/23.
//

import SwiftUI

struct Home: View {
    @AppStorage(UserDefaultKeys.isLoggedIn.rawValue) var isLogin: Bool = false
    @EnvironmentObject var dataManager: DataManager
    var body: some View {
        if isLogin {
            ListView()
                .environmentObject(dataManager)
        } else {
            Login()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(DataManager())
    }
}
