////
////  allInOne.swift
////  Q-Plan it Calendar
////
////  Created by Izzy Bravo on 8/8/23.
////
//
//import FirebaseFirestore
//import FirebaseAuth
//import Foundation
//
//class allInOneModel: ObservableObject {
//    @Published var currentUserId: String = ""
//    @Published var user: User?
//    @Published var showingNewItemView = false
//    @Published var eventItems: [PlanItItem] = []
//    @Published var errorMessage = ""
//
//    private var authHandler: AuthStateDidChangeListenerHandle?
//
//    init() {
//        setupAuthentication()
//        fetchUserData()
//        fetchEventItems()
//    }
//
//    private func setupAuthentication() {
//        authHandler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
//            DispatchQueue.main.async {
//                self?.currentUserId = user?.uid ?? ""
//            }
//        }
//    }
//    private func fetchUserData() {
//        guard let userId = Auth.auth().currentUser?.uid else {
//            return
//        }
//        let db = Firestore.firestore()
//        db.collection("user").document(userId).getDocument { [weak self] snapshot, error in
//            guard let data = snapshot?.data(), error == nil else {
//                return
//            }
//            DispatchQueue.main.async {
//                self?.user = User(
//                    id: data["id"] as? String ?? "",
//                    name: data["name"] as? String ?? "",
//                    email: data["email"] as? String ?? "",
//                    joined: data["joined"] as? TimeInterval ?? 0
//                )
//            }
//        }
//    }
//    internal func fetchEventItems() {
//        guard let userId = Auth.auth().currentUser?.uid else {
//            return
//        }
//        let db = Firestore.firestore()
//        db.collection("user").document(userId).collection("todos").getDocuments { [weak self] snapshot, error in
//            guard let documents = snapshot?.documents, error == nil else {
//                return
//            }
//            DispatchQueue.main.async {
//                self?.eventItems = documents.compactMap { document in
//                    PlanItItem(
//                        id: document["id"] as? String ?? "",
//                        title: document["title"] as? String ?? "",
//                        eventDate: document["eventDate"] as? TimeInterval ?? 0,
//                        createDate: document["createDate"] as? TimeInterval ?? 0,
//                        isDone: document["isDone"] as? Bool ?? false
//                    )
//                }
//            }
//        }
//    }
//
//    func toggleIsDone(item: PlanItItem) {
//        var itemCopy = item
//        itemCopy.setDone(!item.isDone)
//
//        guard let uid = Auth.auth().currentUser?.uid else {
//            return
//        }
//        let db = Firestore.firestore()
//        db.collection("user").document(uid).collection("todos").document(itemCopy.id).setData(itemCopy.asDictionary())
//    }
//}
