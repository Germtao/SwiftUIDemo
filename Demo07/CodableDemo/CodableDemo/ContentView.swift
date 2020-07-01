//
//  ContentView.swift
//  CodableDemo
//
//  Created by QDSG on 2020/7/1.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var user = User(name: "", address: Address(street: "", city: ""))
    @State private var showingAlert = false
    
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                self.user = user
                self.showingAlert = true
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text(user.name),
                message: Text("\(user.address.city)\n\(user.address.street)"),
                dismissButton: .default(Text("知道了"))
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
