//
//  Home.swift
//  Suno
//
//  Created by Tarun on 03/04/23.
//

import SwiftUI

struct Home: View {
    @State private var userLoggedIn = false
    @EnvironmentObject var dataManager: DataManager
    var body: some View {
        if userLoggedIn {
            VStack {
                ListView()
            }
        } else {
            SignUp(action: {
                userLoggedIn.toggle()
            })
            .environmentObject(dataManager)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
