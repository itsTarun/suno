// ContentView.swift
// StreamCast

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var internetMonitor = InternetMonitor()

    var body: some View {
        Text( internetMonitor.isAvailable ? "Connected!" : "Not connected")
            .bold()
            .foregroundColor( internetMonitor.isAvailable ? .green : .red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
