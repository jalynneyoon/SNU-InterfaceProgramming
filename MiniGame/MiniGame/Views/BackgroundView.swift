//
//  BackgroundView.swift
//  MiniGame
//
//  Created by Johyeon Yoon on 2021/10/11.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game : Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .background(
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct TopView : View {
    @Binding var game : Game
    
    var body : some View {
        HStack {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
        .padding()
    }
}

struct BottomView : View {
    @Binding var game : Game
    
    var body : some View {
        HStack {
            NumberView(title: "SCORE", number: 0)
            Spacer()
            NumberView(title: "ROUND", number: 0)
        }
        .padding(30)
    }
}


struct NumberView : View {
    var title : String
    var number : Int
    
    var body: some View {
        VStack {
            LabelText(text: title)
            RoundedRectView(number: number)
        }
        
    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
        BackgroundView(game: .constant(Game()))
            .preferredColorScheme(.dark)

    }
}
