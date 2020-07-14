//
//  DetailView.swift
//  Bookworm
//
//  Created by QDSG on 2020/7/13.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI
import CoreData

struct DetailView: View {
    let book: Book
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showingDeleteAlert = false
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: geo.size.width)
                    
                    Text(self.book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }
                
                Text(self.book.author ?? "Unknown Author")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Text(self.book.review ?? "No Review")
                    .padding()
                
                self.dateView().padding()
                
                RatingView(rating: .constant(Int(self.book.rating)))
                    .font(.largeTitle)
                
                Spacer()
            }
        }
        .navigationBarTitle(Text(book.title ?? "Unknown Book"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showingDeleteAlert.toggle()
        }) {
            Image(systemName: "trash")
        })
        .alert(isPresented: $showingDeleteAlert) {
            Alert(title: Text("删除书本"), message: Text("确定要删除吗？"), primaryButton: .destructive(Text("删除"), action: {
                self.deleteBook()
            }), secondaryButton: .cancel(Text("取消")))
        }
    }
    
    func deleteBook() {
        moc.delete(book)
        
        try? moc.save()
        
        presentationMode.wrappedValue.dismiss()
    }
    
    func dateView() -> Text {
        guard let date = self.book.date else { return Text("Unknown Date") }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateStr = formatter.string(from: date)
        return Text(dateStr)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book; I really enjoyed it."
        book.date = Date()
        
        return NavigationView {
            DetailView(book: book)
        }
    }
}
