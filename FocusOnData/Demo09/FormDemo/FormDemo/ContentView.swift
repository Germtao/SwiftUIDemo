//
//  ContentView.swift
//  FormDemo
//
//  Created by QDSG on 2020/7/3.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var email = ""
    
    var disabledForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("用户名", text: $username)
                TextField("邮箱", text: $email)
            }
            
            Section {
                Button("注册") {
                    print("注册一个账户")
                }
            }
            .disabled(disabledForm)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
