//
//  Book.swift
//  SecondPractice
//
//  Created by Johyeon Yoon on 2021/12/06.
//

import Foundation

class Book: ObservableObject {
    let title : String
    let author : String
    @Published var readMe: Bool

    
    init(title : String = "Title",
         author : String = "Author",
         readMe : Bool = true) {
        self.title = title
        self.author = author
        self.readMe = readMe
    }
}


extension Book : Hashable, Identifiable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


extension Book : Equatable {
    static func == (lhs : Book, rhs : Book) -> Bool {
        lhs === rhs
    }
}
