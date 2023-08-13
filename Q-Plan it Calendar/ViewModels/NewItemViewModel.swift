//
//  NewItemViewModel.swift
//  Q-Plan it Calendar
//
//  Created by Izzy Bravo on 7/30/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var eventDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }

        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }

        let newId = UUID().uuidString
        let newItem = PlanItItem(
            id: newId,
            title: title,
            eventDate: eventDate.timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        let db = Firestore.firestore()
        
        db.collection("user")
            .document(uID)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard eventDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
