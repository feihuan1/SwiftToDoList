//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//
import FirebaseFirestore
import Foundation

// big todo list
class ToDoListViewViewModel: ObservableObject {
    @Published var isShowingNewItemView = false // private set maybe
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    // change state in viewmodel not outside
    func toggleIsShowingNewItemView (newValue: Bool) {
        isShowingNewItemView = newValue
    }
    
    // mistake in previouse project--- always use id, dont need pass in the entire object
    func delete(id: String) {
        // get instance of database
        let db = Firestore.firestore()
        
        db.collection("users")
        //path to this specific todo
            .document(userId)
            .collection("todos")
            .document(id)
            .delete() // simple enough FirestoreQuery in ToDoListView will live listen to change and remove from ui
        
    }
    
}
