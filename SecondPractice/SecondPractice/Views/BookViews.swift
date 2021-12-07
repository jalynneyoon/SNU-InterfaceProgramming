//
//  BookViews.swift
//  SecondPractice
//
//  Created by Johyeon Yoon on 2021/12/06.
//

import SwiftUI

extension Book {
    struct Image : View {
        let image : SwiftUI.Image?
        let title : String
        var size : CGFloat?
        
        var body: some View {
            if let image = image{
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width : size, height: size)
            } else {
                let symbol = SwiftUI.Image(title: title)
                ?? .init(systemName: "book")
                
                symbol
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .font(Font.title.weight(.light))
                    .foregroundColor(.secondary.opacity(0.5))
            }
        }
    }
}


extension Image {
    // optional init. nil이 리턴될 수 있다.
    init?(title : String) {
        // 옵셔널 바인딩과 조건문을 같이 쓰고자 할 때, case 를 사용한다.
        guard let character = title.first,
        case let symbolName = "\(character.lowercased()).square",
        UIImage(systemName: symbolName) != nil else {
            return nil
        }
        
        self.init(systemName: symbolName)
    }
}

extension Book.Image {
    /// A preview image
    init(title: String) {
        self.init(image: nil, title: title)
    }
}

extension View {
    var previewedInAllColorSchemes: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: preferredColorScheme)
    }
}

struct Book_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TitleAndAuthorStack(book: .init(), titleFont: .title, authorFont: .title2)
            Book.Image(title: Book().title)
            Book.Image(title: "")
            Book.Image(title: "😃")
        }.previewedInAllColorSchemes
    }
}

