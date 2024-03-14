//
//  ContentView.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        // if is signed in and there is a user id, show the home view, other wise get user to login page
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // already signed in
            
            // computed view| benifits: conditional view composition, Readability, code reuseability, seperation of concern
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
    
}

#Preview {
    MainView()
}

