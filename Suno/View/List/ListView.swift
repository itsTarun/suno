//
//  ListView.swift
//  Suno
//
//  Created by Tarun on 03/04/23.
//

import AVFoundation
import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showLogoutAlert = false
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    @AppStorage(UserDefaultKeys.isLoggedIn.rawValue) var isLogin: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(1...10, id: \.self) {_ in
                        CustomNavLink(
                            destination: Text("Ganesh JI")
                                .customNavigationTitle("Ganesh Ji Ki Aarti")
                                .customNavigationSubTitle("Please let us know if you want custom playlist for you...")
                        ) {
                            ListCell(bhajan: Bhajan())
                                .frame(width: (UIScreen.main.bounds.width - 50) / 2, height: 180)
                                .cornerRadius(15)
                        }
                    }
                }
                .padding()
                .padding(.bottom, 160)
                .navigationTitle("Listen Now")
                .toolbar {
                    ToolbarItem {
                        Button {
                            showLogoutAlert.toggle()
                        } label: {
                            Image(systemName: "gear")
                                .font(.headline)
                        }
                    }
                }
                .alert(isPresented: $showLogoutAlert, content: {
                    Alert(title: Text("Are you sure, you want to logout?"), primaryButton: Alert.Button.cancel(), secondaryButton: Alert.Button.destructive(Text("Yes"), action: {
                        isLogin = false
                    }))
                })
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
