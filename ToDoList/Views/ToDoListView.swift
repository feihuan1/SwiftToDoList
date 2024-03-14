//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    // instead create instance/ we vreate StateObject in init adn wrapped value is the viewModel with id passed from main view
    @FirestoreQuery var items: [ToDoListItem] // firestoreQuery will observed changes in this lise, this case it will continue watch the todo list of this user
    
    // userId come from MainView
    init(userId: String) {
        // path: users/userId/ todos/ <entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        // this is complecated as hell but its better practise// practise it in next project!!!!
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView {
            VStack {
                List(items) {item in
                ToDoListItemView(item: item)
                        .swipeActions{// none Dynamic item swipte action modifier
                            Button("Delete") {
                                //Delete todo
                                viewModel.delete(id: item.id) // make sure change state in viewModle / pass in id instead of entire object
                            }
                            .tint(.red)// this is the background, dont use background if you dont want stuck 2 hour again!!!! tintintitntintint
                        }
                }
                .listStyle(.plain)
                
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
    ToDoListView(userId: "JCUjuKlelgcrAOT5nAkQ5QPUe3m2")
}
