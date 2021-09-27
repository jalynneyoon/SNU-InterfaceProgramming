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
            Color(.lightGray)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("🍎🍎🍎 \n Put the bulleyes as close as you can!".uppercased())
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(5.0)
                    .font(.subheadline)
                    .padding([.leading, .trailing], 30.0)
                
                Text(String(game.target))
                    .kerning(-1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                HStack {
                    Text("1")
                        .bold()
                    Slider(value: $slideValue, in: 1.0...100.0)
                    Text("100")
                        .bold()
                }
                .padding()
                
                Button(action: {
                    alertIsVisible = true
                }) {
                    Text("Hit me")
                        .bold()
      
                }
                .foregroundColor(.white)
                .padding(20.0)
                .background(Color.blue)
                .cornerRadius(15.0)

                .alert(isPresented: $alertIsVisible, content: {
                    let roundedValue = Int(slideValue.rounded())
                    return Alert(title: Text("Hello,there"),
                                 message: Text("The slide value is \(roundedValue)\n" + "Your score is \(game.calculatePoints(slideValue: roundedValue)) points"),
                                 dismissButton: .default(Text("Awesome!")))
                })
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        ContentView().previewLayout(.fixed(width: 568.0, height: 320.0))
    }
}
