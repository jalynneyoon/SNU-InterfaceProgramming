//
//  Shapes.swift
//  MiniGame
//
//  Created by Johyeon Yoon on 2021/10/11.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack{
            Circle()
                .strokeBorder(Color.blue, lineWidth: 20.0)
                .frame(width: 200, height: 100.0)
            RoundedRectangle(cornerRadius:  Constants.General.roundedRectCornerRadius)
                .fill(Color.blue)
                .frame(width: 200, height: 100)
            
            Capsule()
                .fill(Color.blue)
                .frame(width: 200, height: 100)
            
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
