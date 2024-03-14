//
//  LoginView.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                 // title here
                HeaderView(title: "To Do List", subTitle: "Get Things Done", angle: 15, backgound: .pink)


                    
                Form{
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(.automatic)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(.automatic)
                    
                    TLButton(title: "Lon In", background: .blue) {
                        // moment of truth function here
                        viewModel.login()
                    }
                    .padding()

                }// form ends here
                .offset(y: -50)
                //register link here if not stucked
                Spacer()
                VStack {
                    Text("New aounnd here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }// outter vstack
        }// navigationView
    }
}

#Preview {
    LoginView()
}
