//
//  ContentView.swift
//  MiniGame
//
//  Created by Johyeon Yoon on 2021/09/13.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var slideValue = 50.0
    
    @State var game = Game()
    
    var body: some View {
        
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0.0 : 100.0)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $slideValue, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButton(alertIsVisible: $alertIsVisible, slideValue: $slideValue, game: $game)
                        .transition(.scale)
                }
                
            }  // vstack
            if !alertIsVisible {
                SliderView(slideValue: $slideValue)
                    .transition(.scale)
            }
            
        }
        
    }
}


struct InstructionsView : View {
    @Binding var game : Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🍎🍎🍎 \n Put the bulleyes as close as you can!")
                .padding([.leading, .trailing], 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView : View {
    @Binding var slideValue : Double
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $slideValue, in: 1.0...100.0)
            Text("100")
                .bold()
        }
        
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible : Bool
    @Binding var slideValue : Double
    @Binding var game : Game

    var body : some View {
        Button(action: {
            withAnimation {
                alertIsVisible = true
            }
        }) {
            HitMeButtonView(text: "Hit me")
        }
        
    }
    }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{

            ContentView().previewLayout(.fixed(width: 568.0, height: 320.0))
            ContentView().previewLayout(.fixed(width: 568.0, height: 320.0))
                .preferredColorScheme(.dark)
            
        }
    }
}

