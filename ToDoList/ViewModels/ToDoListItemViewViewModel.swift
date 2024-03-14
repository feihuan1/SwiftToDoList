//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation


// single todo cell
class ToDoListItemViewViewModel: ObservableObject {
    
    
    init() {
        
    }
    
    // updating state in firebase!!!!
    func toggleIsDone (item: ToDoListItem) {
        var itemCopy = item // make a copy of current item/ item is immutabble , passed in as a value type
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        } // make sure there is a user
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id) // this is exact same id as the oringal item, so it set date not creating new date
            .setData(itemCopy.asDictionary()) // dont forget Json it
    }
}
