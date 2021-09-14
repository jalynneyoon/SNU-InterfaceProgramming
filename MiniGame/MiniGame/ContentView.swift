//
//  ContentView.swift
//  MiniGame
//
//  Created by Johyeon Yoon on 2021/09/13.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible : Bool = false
    @State private var slideValue : Double = 50.0
    var body: some View {
        
        VStack {
            Text("🎯🎯🎯 \n Put the bulleyes as close as you can!".uppercased())
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(5.0)
                .font(.subheadline)
                .padding()
            
            Text(String(Int(self.slideValue)))
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            
            HStack {
                Text("1")
                    .bold()
                Slider(value: self.$slideValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            Button(action: {
                self.alertIsVisible = true
                print("hello, swiftUI")
            }) {
                Text("Hit me")
  
            }
            .alert(isPresented: self.$alertIsVisible, content: {
                return Alert(title: Text("Hello,there"),
                             message: Text("The slide value is \(self.slideValue)"),
                             dismissButton: .default(Text("Awesome!")))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568.0, height: 320.0))
    }
}
