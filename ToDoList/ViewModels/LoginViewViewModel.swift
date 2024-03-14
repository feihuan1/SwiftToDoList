//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//
import FirebaseAuth
import Foundation
// firebase will persist user login , dont need save log in status in user defaults

class LoginViewViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        // try log in call Auth.auth.signIn
        Auth.auth().signIn(withEmail: email, password: password) // al you need do to sign in
    }
    
    func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "🖕🖕🖕"
            print("empty input at login")
            return false
        }
        
        guard email.contains("@"), email.contains(".") else {
            errorMessage = "use a real email!!!"
            print("invalid email at login")
            return false
        }
        
        return true
    }
 
}
