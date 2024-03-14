//
//  HeaderView.swift
//  ToDoList
//
//  Created by Feihuan Peng on 3/13/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angle: Double
    let backgound: Color
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgound)
                .rotationEffect(Angle(degrees: angle))
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .bold()
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
            }
            .padding(.top, 130)
        }
        .frame(width: UIScreen.main.bounds.width * 2, height: 300)
        .offset(y: -200)

    }
}

#Preview {
    HeaderView(title: "Title", subTitle: "Subtitle", angle: 15, backgound: .blue)
}
