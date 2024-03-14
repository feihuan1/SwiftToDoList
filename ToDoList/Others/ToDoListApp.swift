//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//

import SwiftUI
import FirebaseCore




@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }


  var body: some Scene {
    WindowGroup {
      NavigationView {
        MainView()
      }
    }
  }
}
