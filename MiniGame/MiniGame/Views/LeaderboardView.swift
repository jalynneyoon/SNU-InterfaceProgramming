//
//  LeaderboardView.swift
//  MiniGame
//
//  Created by Johyeon Yoon on 2021/10/18.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game : Game
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack{
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                
                ScrollView {
                    VStack {
                        ForEach(game.leaderboardEntries.indices) {
                            let leaderboardEntry = game.leaderboardEntries[$0]
                            RowView(index: $0, score: leaderboardEntry.score, date: leaderboardEntry.date)
                            
                        }
                    }
                    
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}


struct HeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderboardIsShowing: Bool
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "Leaderboard")
                    Spacer()
                } else{
                    BigBoldText(text: "Leaderboard")
                }
                
            }
            .padding([.top, .leading])

            HStack {
                Spacer()
                Button(action: {
                    leaderboardIsShowing = false                    
                }){
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding([.top, .trailing])
                }
            }
            
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LeaderboardView(leaderboardIsShowing: Binding.constant(true),
                            game: Binding.constant(Game()))
            LeaderboardView(leaderboardIsShowing: Binding.constant(true),
                            game: Binding.constant(Game()))
                .previewLayout(.fixed(width: 568, height: 320))
            LeaderboardView(leaderboardIsShowing: Binding.constant(true),
                            game: Binding.constant(Game()))
                .preferredColorScheme(.dark)
            LeaderboardView(leaderboardIsShowing: Binding.constant(true),
                            game: Binding.constant(Game()))
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 568, height: 320))
        }
    }
}
