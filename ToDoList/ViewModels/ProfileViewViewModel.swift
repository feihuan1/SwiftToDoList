//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel: ObservableObject {
    @Published var user: User? = nil
    
    init() {}
    
    func fetchUser() {
        // if user not signed in , return
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        // get instance of databse
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId) // get into the user with same id
            .getDocument { [weak self] snapshot, error in // get document has snapshot with data init also error
                guard let data = snapshot?.data(), error == nil else { // make sure there is data in snapshot and there is no error
                    return
                }
                // assign a user will trigger a refresh so use dispatch main tread queue
                DispatchQueue.main.async {
                    // create a new instance of User model
                    self?.user = User(id: data["id"] as? String ?? ""
                                      , name: data["name"] as? String ?? ""
                                      , email: data["email"] as? String ?? ""
                                      , joined: data["joined"] as? TimeInterval ?? 0
                    )
                }
            }
    }
    
    func logout () {
        do {
            try Auth.auth().signOut()
        } catch  {
            print("Trouble signing out")
        }
    }
}
