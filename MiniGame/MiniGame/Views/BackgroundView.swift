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
            RingsView()
        )
    }
}

struct TopView : View {
    @Binding var game : Game
    @State var leaderboardIsShowing = false
    @State var informationIsShowing = false
    
    var body : some View {
        HStack(alignment : .top) {
            Button(action: {
                game.restart()
            }) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            
            VStack(spacing : 10) {
                // 리더보드
                Button(action : {
                    game.sortLeaderboard()
                    leaderboardIsShowing = true
                }) {
                    RoundedImageViewFilled(systemName: "list.dash")
                }
                .sheet(isPresented: $leaderboardIsShowing) {} content: {
                    LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
                }
                // info
                Button(action: {
                    informationIsShowing = true
                }) {
                    RoundedImageViewStroked(systemName: "info")
                }
                .sheet(isPresented: $informationIsShowing) {} content: {
                    InformationView(informationIsShowing: $informationIsShowing)
                    
                }
            }
        }
        
        .padding()
    }
}

struct BottomView : View {
    @Binding var game : Game
    
    var body : some View {
        HStack {
            NumberView(title: "SCORE", number: game.score)
            Spacer()
            NumberView(title: "ROUND", number: game.round)
        }
        .padding(30)
    }
}


struct RingsView : View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<5) {
                let size = CGFloat($0 * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [
                            Color("RingsColor").opacity(opacity * 0.8),
                            Color("RingsColor").opacity(0.0)
                            ]),
                        center: .center, startRadius: 100, endRadius: 300)
                    )
                    .frame(width: size, height: size)
            }
            
        }
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
        BackgroundView(game: .constant(Game())).previewLayout(.fixed(width: 568.0, height: 320.0))
        BackgroundView(game: .constant(Game()))
        
        BackgroundView(game: .constant(Game())).previewLayout(.fixed(width: 568.0, height: 320.0))
            .preferredColorScheme(.dark)
        
        BackgroundView(game: .constant(Game()))
            .preferredColorScheme(.dark)
        

    }
}
