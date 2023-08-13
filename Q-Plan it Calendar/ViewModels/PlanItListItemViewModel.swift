//
//  PlanItListItemViewModel.swift
//  Q-Plan it Calendar
//
//  Created by Izzy Bravo on 8/12/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class PlanItListItemViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: PlanItItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("user")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
