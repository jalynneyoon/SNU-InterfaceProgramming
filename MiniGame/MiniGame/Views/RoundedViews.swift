//
//  RoundedViews.swift
//  MiniGame
//
//  Created by Johyeon Yoon on 2021/10/11.
//

import SwiftUI

struct RoundedImageViewStroked : View {
    var systemName : String
    var body : some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height : 56.0)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
            )
    }
}

struct RoundedImageViewFilled : View {
    var systemName : String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .frame(width: 56.0, height : 56.0)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
            .foregroundColor(Color("ButtonFilledTextColor"))
        
    }
}


struct RoundedRectView : View {
    var number : Int
    var body : some View {
        ZStack {
            Text(String(number))
                .foregroundColor(Color("TextColor"))
                .font(.title2)
                .bold()
            RoundedRectangle(cornerRadius: 15.0)
                .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
                .frame(width: 70, height : 70)
                .background(
                    Color("BackgroundFilledColor")
                )
        }
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
//        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
        RoundedRectView(number: 100)
            .preferredColorScheme(.dark)
    }
}
