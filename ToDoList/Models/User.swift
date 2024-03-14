//
//  User.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
