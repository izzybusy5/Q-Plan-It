//
//  PlanItListViewModel.swift
//  Q-Plan it Calendar
//
//  Created by Izzy Bravo on 7/30/23.
//

import FirebaseFirestore
import Foundation

class PlanItListViewModel: ObservableObject {
    @Published var showingNewItemView = false

    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("user")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
