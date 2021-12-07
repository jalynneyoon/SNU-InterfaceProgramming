//
//  ContentView.swift
//  SecondPractice
//
//  Created by Johyeon Yoon on 2021/12/05.
//

import SwiftUI

struct ContentView: View {
    @State var libaray = Library()
    var body: some View {
        NavigationView {
            List(libaray.sortedBooks, id: \.self) { book in
                BookRow(book : book, image : $libaray.images[book])
                
            }
            .navigationTitle("My Library")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BookRow: View {
    @ObservedObject var book : Book
    @Binding var image : Image?
    
    var body: some View {
        NavigationLink(destination: DetailView(book: book, image : $image)){
            HStack {
                Book.Image(image: image, title: book.title, size: 80.0)
                TitleAndAuthorStack(book : book,
                                    titleFont: .title2,
                                    authorFont: .title3)
                    .lineLimit(1)
            }
        }
        .padding(.vertical)
    }
}

struct TitleAndAuthorStack: View {
    let book : Book
    let titleFont: Font
    let authorFont: Font
    
    var body: some View {
        VStack(alignment : .leading) {
            Text(book.title)
                .font(titleFont)
            Text(book.author)
                .font(authorFont)
                .foregroundColor(.secondary)
        }
    }
}
