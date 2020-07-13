//
//  ContentView.swift
//  Bookworm
//
//  Created by QDSG on 2020/7/8.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        List {
            ForEach(books, id: \.self) { book in
                NavigationLink(destination: Text(book.title ?? "Unknown Title")) {
                    EmojiRatingView(rating: book.rating)
                        .font(.largeTitle)
                    
                    VStack(alignment: .leading) {
                        Text(book.title ?? "Unknown Title")
                            .font(.headline)
                        Text(book.author ?? "Unknown Author")
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
