//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Todo List")
            .toolbar {
                Button {
                    // go to add todo view
                    viewModel.toggleIsShowingNewItemView(newValue: true)
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.isShowingNewItemView ) {
                NewItemView(isShowingNewItemView: $viewModel.isShowingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
