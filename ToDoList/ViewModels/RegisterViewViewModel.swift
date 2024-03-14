//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init () {
        
    }
    
    func register() {
        guard validate() else {
            return
        }
        // create user here
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            // if successed, should get a User back, and there will be a uid in it
            guard let userId = result?.user.uid else {
                return
            }
            // now insert User into database
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        // fire base cant store Date type, must transfer to a string all a time since 1970
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        // insert to database
        // init database
        let db = Firestore.firestore()
        // create a collection with collection name
        db.collection("users")
            .document(id) // create document inside the collection, long random uniq letters
            .setData(newUser.asDictionary()) // User is Cadable, witch will get the Extention of Encadable // this will sets data as json to firestore
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "🖕🖕🖕"
            print("empty input at register")
            return false
        }
        
        guard email.contains("@"), email.contains(".") else {
            errorMessage = "use a real email!!!"
            print("invalid email at register")
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "password too short (require 6 or longer)"
            print("invalid password at register")
            return false
        }
        return true
    }
    
}
