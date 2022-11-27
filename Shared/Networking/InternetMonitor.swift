//  InternetMonitor.swift
//  StreamCast

import Foundation
import Network

class InternetMonitor: ObservableObject {
    
    private let monitor = NWPathMonitor()
    
    @Published var isAvailable = true
    
    init() {
        
        let queue = DispatchQueue(label: "com.liquidcoder.Streamcast.InternetMonitor")
        
        monitor.pathUpdateHandler = { path in
            
            DispatchQueue.main.async {
                self.isAvailable = path.status == .satisfied
            }
        }
        
        monitor.start(queue: queue)
        
    }
    
}
