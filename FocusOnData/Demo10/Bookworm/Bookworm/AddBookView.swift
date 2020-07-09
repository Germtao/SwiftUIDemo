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
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
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
                    Picker("评分", selection: $rating) {
                        ForEach(0..<6) {
                            Text("\($0)")
                        }
                    }
                    
                    TextField("评论", text: $review)
                }
                
                Section {
                    Button("保存") {
                        self.addBook()
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
        
        try? moc.save()
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
