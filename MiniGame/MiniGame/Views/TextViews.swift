//
//  TextViews.swift
//  MiniGame
//
//  Created by Johyeon Yoon on 2021/10/11.
//

import SwiftUI


struct InstructionText: View {
    var text : String
    var body : some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(5.0)
            .font(.subheadline)
    }
}

struct BigNumberText: View{
    var text : String
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

struct SliderLabelText: View {
    var text : String
    
    var body: some View {
        Text(text)
            .bold()
    }
}

struct LabelText: View {
    var text : String
    var body : some View {
        Text(text)
    }
}

struct BodyText : View {
    var text : String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonText: View {
    var text : String
    var body : some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(12.0)
    }
}


struct ScoreText: View {
    var score: Int
    var body: some View {
        Text(String(score))
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}
struct DateText: View {
    var date: Date
    var body: some View {
        Text(date, style: .time)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct BigBoldText: View {
    var text : String
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .font(.title)
    }
}

struct InformationHeaderText: View {
    var text : String
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .font(.title)
            .fontWeight(.bold)
    }
}

struct HitMeButtonView: View {
    var text : String
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(.white)
            .padding(20.0)
            .background(
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [.white.opacity(0.3), .clear]), startPoint: .top, endPoint: .bottom)
                }
                
            )
            .cornerRadius(Constants.General.roundedRectCornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                    .strokeBorder(Color.white, lineWidth: 2.0)
            )
    }
}


struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "89")
            SliderLabelText(text: "100")
            LabelText(text: "Score")
            BodyText(text: "You scored 200 Points\n🎉🎉🎉")
                
            ButtonText(text: "Start New Round")
            InformationHeaderText(text: "InformationHeader")
        }
    }
}
