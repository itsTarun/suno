//
//  ListView.swift
//  Suno
//
//  Created by Tarun on 03/04/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    @AppStorage(UserDefaultKeys.isLoggedIn.rawValue) var isLogin: Bool = false
    
    var body: some View {
        NavigationView {
            List(dataManager.bhajans, id: \.id) { bhajan in
                NavigationLink {
                    Text("Hello")
                } label: {
                    Text(bhajan.name)
                }
            }
            .navigationTitle("Bhajans")
            .toolbar {
                ToolbarItem {
                    Button {
                        isLogin = false
                    } label: {
                        Image(systemName: "seal.fill")
                    }
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DataManager())
    }
}
