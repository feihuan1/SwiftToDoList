//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//
import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    
    // default will be nil
    private var handler: AuthStateDidChangeListenerHandle?
    
    public var isSignedIn: Bool {
       
            // if there is a current user, return true
            return Auth.auth().currentUser != nil
        }
    
    
    
    init(){
        // observe when current user in firebase changes // weak self ensure wont cause memory leak
        self.handler = Auth.auth().addStateDidChangeListener{[weak self] _, user in
            // sign in published currentuser, we  want this join the main thread
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
}
