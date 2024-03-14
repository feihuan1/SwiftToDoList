//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//

import Foundation

// big todo list
class ToDoListViewViewModel: ObservableObject {
    @Published var isShowingNewItemView = false
    
    init() {
        
    }
    
    func toggleIsShowingNewItemView (newValue: Bool) {
        isShowingNewItemView = newValue
    }
}
