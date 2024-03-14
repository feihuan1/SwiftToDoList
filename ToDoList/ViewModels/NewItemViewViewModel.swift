//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var isShowAlert = false
    
    init() {
        
    }
    
    func save () {
        // if not valid, quit function
        guard canSave else {
            return
        }
        //        get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            //            if no user, dont save
            return
        }
        // create new todo model
        let newId = UUID().uuidString // convert id to a string
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false) // all date should conver to timeIntervalsince1970, conver back when display, faise base cant store Date Type
        
        // save model into curent user
        let db = Firestore.firestore() // get instance of datebase
        
        db.collection("users")
            .document(uId)// get in to that currentuser object
            .collection("todos") // create new collection under that user
            .document(newId) // add a new id as child of todos collection under that user
            .setData(newItem.asDictionary()) // set new todo in to there // convert it to Json
    }
    
    var canSave: Bool {
        // if title is emty, dont let save happen
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        // subtract 1 day from today make sure due day is greater or equal to today
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
