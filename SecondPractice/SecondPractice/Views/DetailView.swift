//
//  DetailView.swift
//  SecondPractice
//
//  Created by Johyeon Yoon on 2021/12/06.
//

import class PhotosUI.PHPickerViewController
import SwiftUI

struct DetailView: View {
    @ObservedObject var book: Book
    @Binding var image: Image?
    @State var showingImagePicker = false
    @State var showingDialog = false
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndAuthorStack(book: book,
                                titleFont: .title,
                                authorFont: .title2
            )
            
            Book.Image(image: image,
                       title: book.title)
                .scaledToFit()
            
            HStack {
                if image != nil {
                    Spacer()
                    Button("Delete Image") {
                        showingDialog = true
                    }
                }
                Spacer()
                Button("Update Image...") {
                    showingImagePicker = true
                }
                Spacer()
            }  // 이미지 추가 유무에 따른 HStack
            
            .sheet(isPresented: $showingImagePicker) {
                PHPickerViewController.View(image: $image)
            }
            .confirmationDialog(
                "Delete image for \(book.title)?",
                isPresented: $showingDialog) {
                    Button("Delete", role: .destructive) {
                        image = nil
                    }
                } message: {
                    Text("Delete image for \(book.title)?")
                }
            
        } // 최상위 VStack
        .padding()
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init(), image: .constant(nil))
            .previewedInAllColorSchemes
    }
}
