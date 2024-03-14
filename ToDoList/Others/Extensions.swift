//
//  Extensions.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//

import Foundation

// this is part of Codable protocol
extension Encodable {
    func asDictionary() -> [String: Any] {
        // if data is not codable, return a empty dictionary
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            // convert data to json here and cast it as [String: Any]
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:] // return empty if can't cast to [String: Any]
        } catch  {
            return [:]
        }
        
    }
}
