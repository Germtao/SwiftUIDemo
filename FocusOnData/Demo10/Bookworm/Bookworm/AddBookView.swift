//
//  AddBookView.swift
//  Bookworm
//
//  Created by QDSG on 2020/7/8.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    
    /// 环境属性来跟踪当前的演示模式
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    /// 流派选项
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("书名", text: $title)
                    TextField("作者", text: $author)
                    
                    Picker("流派", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    RatingView(rating: $rating)
                    
                    TextField("评论", text: $review)
                }
                
                Section {
                    Button("保存") {
                        self.addBook()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle("添加书本")
        }
    }
    
    func addBook() {
        let newBook = Book(context: moc)
        newBook.title = title
        newBook.author = author
        newBook.genre = genre
        newBook.rating = Int16(rating)
        newBook.review = review
        newBook.date = Date()
        
        try? moc.save()
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
