//
//  ListView.swift
//  Suno
//
//  Created by Tarun on 03/04/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationView {
            List(dataManager.bhajans, id: \.id) { allBhajan in
                Text(allBhajan.name)
            }
            .navigationTitle("Bhajans")
            .toolbar {
                ToolbarItem {
                    Button {
                        
                    } label: {
                        Image(systemName: "apple.logo")
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
