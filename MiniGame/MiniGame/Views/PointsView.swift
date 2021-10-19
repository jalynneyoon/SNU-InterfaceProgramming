//
//  PointsView.swift
//  MiniGame
//
//  Created by Johyeon Yoon on 2021/10/18.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisible : Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(slideValue: roundedValue )
        VStack {
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) Points\n🎉🎉🎉")
            
            Button(action: {
                
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
                
            }) {
                ButtonText(text: "Start New Round")
               
            }

            }
            .padding()
            .frame(maxWidth: 300.0)
            .background(Color("BackgroundColor"))
            .cornerRadius(10.0)
            .shadow(radius: 10.0, x: 5.0, y: 5.0)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        Group {
            PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
                .previewLayout(.fixed(width: 568, height: 320))
            PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 568, height: 320))
        }
    }
}
