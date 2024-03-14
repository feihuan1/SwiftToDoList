//
//  ProfileView.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
