//
//  NewItemView.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var isShowingNewItemView: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                // Title
                TextField("Add A New Todo and select a due date", text: $viewModel.title)
                    .textFieldStyle(.automatic)
                // DueDate
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                //Button
                TLButton(title: "Add", background: .pink) {
                    // add todo to database and fetch it back show in todo list
                    // make sure user input make sense
                    if viewModel.canSave {
                        viewModel.save()
                        isShowingNewItemView = false
                    } else {// show alert
                        viewModel.isShowAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.isShowAlert, content: {
                Alert(title: Text("Invalid todo"), message: Text("Fill your task and make sure it's not pass due"))
            })
        }
    }
}

#Preview {
    NewItemView(isShowingNewItemView: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
