//
//  TLButton.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            // shoot to db
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Button", background: .blue) {
        // this is how to put a empty action in preview
    }
}
