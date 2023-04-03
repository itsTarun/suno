//
//  SunoApp.swift
//  Suno
//
//  Created by Tarun on 03/04/23.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct SunoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            Home()
                .environmentObject(dataManager)
        }
    }
}
