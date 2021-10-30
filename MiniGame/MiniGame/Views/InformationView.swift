//
//  InformationView.swift
//  MiniGame
//
//  Created by Johyeon Yoon on 2021/10/29.
//

import SwiftUI

struct InformationView: View {
    var game = Game()
    @State private var slideValue = 50.0
    @Binding var informationIsShowing : Bool
    var body: some View {
        
        VStack {
            HStack {
                InformationHeaderText(text: "🍏HOW TO PLAY🍏")
                Spacer()
                Button(action: {
                    informationIsShowing = false
                }){
                    RoundedImageViewFilled(systemName: "xmark")
                }
            }
            .padding([.leading, .trailing])
            
            Spacer()
            InstructionText(text: "STEP1 : If a targer number is given, \n Put the slide as close as you can!")
            SliderView(slideValue: $slideValue)
                .transition(.scale)
            
            Spacer()
            InstructionText(text: "STEP2 : After you move the slide, \n Touch Hit me Button and check your score!")
            HitMeButtonTextView(text: "Hit me")
            Spacer()
            Spacer()
            Spacer()

        }
        .padding(.top)
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(informationIsShowing: .constant(true))
            .previewLayout(.fixed(width: 568.0, height: 320.0))
        
        InformationView(informationIsShowing: .constant(true))
            .preferredColorScheme(.dark)

            
    }
}
