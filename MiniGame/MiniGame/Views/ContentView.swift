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
            BackgroundView(game: .constant(Game()))
            VStack {
                InstructionsView(game: $game)
                SliderView(slideValue: $slideValue)
                .padding()
                HitMeButton(alertIsVisible: $alertIsVisible, slideValue: $slideValue, game: $game)

            }  // vstack
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
            alertIsVisible = true
        }) {
            Text("Hit me")
                .bold()

        }
        .foregroundColor(.white)
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [.white.opacity(0.3), .clear]), startPoint: .top, endPoint: .bottom)
            }
            
        )
        .cornerRadius(15.0)
        .overlay(
            RoundedRectangle(cornerRadius: 15.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )

        .alert(isPresented: $alertIsVisible, content: {
            let roundedValue = Int(slideValue.rounded())
            let points = game.calculatePoints(slideValue: roundedValue)
            return Alert(title: Text("Hello,there"),
                         message: Text("The slide value is \(roundedValue)\n" + "Your score is \(points) points"),
                         dismissButton: .default(Text("Awesome!")) {
                            game.startNewRound(points: points)
                         }
            )
        })
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
