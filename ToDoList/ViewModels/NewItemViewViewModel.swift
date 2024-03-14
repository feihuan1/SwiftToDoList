//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var isShowAlert = false
    
    init() {
        
    }
    
    func save () {
        
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
