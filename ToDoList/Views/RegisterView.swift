//
//  RegisterView.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//

import SwiftUI


struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()

    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subTitle: "Start organizing todos", angle: -15, backgound: .orange)
            
            Form{
                
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(.automatic)
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(.automatic)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(.automatic)
                
                TLButton(title: "Sign Up", background: .green) {
                    // sign up new user
                    viewModel.register()
                }
                .padding()
            }// form ends here
            .offset(y: -50)

            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
