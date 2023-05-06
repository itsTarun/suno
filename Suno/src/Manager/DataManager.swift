//
//  DataManager.swift
//  Suno
//
//  Created by Tarun on 03/04/23.
//

import SwiftUI
import Firebase
import FirebaseStorage

class DataManager: ObservableObject {
    @Published var bhajans: [Bhajan] = []
    
    init() {
        fetchAllBhajans()
    }
    
    func fetchAllBhajans() {
        bhajans.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Bhajan")
        ref.getDocuments { snapShot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapShot = snapShot {
                for document in snapShot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let image = data["image"] as? String ?? ""
                    let url = data["url"] as? String ?? ""
                    let lrc = data["lrc"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let time = data["time"] as? String ?? "04:59"
                    let duration = data["duration"] as? Int ?? 0
                    let year = data["year"] as? String ?? "2023"
                    
                    // Get a reference to the storage service using the default Firebase App
                    let storage = Storage.storage()
                    
                    // Create a storage reference from our storage service
                    let storageRef = storage.reference()
                    
                    // Create a reference to the file you want to download
                    let starsRef = storageRef.child("Hindu God Images/Ganesh/Ganesh.jpeg")
                    
                    
                    let bhajan = Bhajan(id: id, image: staticImageURL, url: url, lrc: lrc, name: name, time: time, file: url, duration: duration, year: year)
                    
                    self.bhajans.append(bhajan)
                    
                    //                    // Fetch the download URL
                    //                    starsRef.downloadURL { storageURL, error in
                    //                        var bhajan = Bhajan(id: id, image: image, url: url, lrc: lrc, name: name, time: time, file: url, duration: duration, year: year)
                    //                        if let error = error {
                    //                            // Handle any errors
                    //                            print("⚠️ error", error.localizedDescription)
                    //                        } else {
                    //                            // Get the download URL for 'images/stars.jpg'
                    //                            bhajan.image = storageURL?.absoluteString ?? image
                    //                        }
                    //                        self.bhajans.append(bhajan)
                    //                    }
                }
            }
        }
    }
    
    func writeDocument() {
        let db = Firestore.firestore()
        let ref = db.collection("Bhajan").document("hanuman")
        ref.setData([
            "id" : "10",
            "image" : "image",
            "url" : "url",
            "lrc" : "lrc",
            "name" : "name"
        ]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
