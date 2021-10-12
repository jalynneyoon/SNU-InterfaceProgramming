//
//  TextViews.swift
//  MiniGame
//
//  Created by Johyeon Yoon on 2021/10/11.
//

import SwiftUI


struct InstructionText: View {
    var text : String
    var body : some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(5.0)
            .font(.subheadline)
    }
}

struct BigNumberText: View{
    var text : String
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

struct SliderLabelText: View {
    var text : String
    
    var body: some View {
        Text(text)
            .bold()
    }
}

struct LabelText: View {
    var text : String
    var body : some View {
        Text(text)
    }
}



struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        InstructionText(text: "🍎🍎🍎 \n Put the bulleyes as close as you can!")
           
        
    }
}
