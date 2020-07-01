//
//  ContentView.swift
//  Moonshot
//
//  Created by QDSG on 2020/7/1.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let astronauts = Bundle.main.decode("astronauts.json")
        
        return Text("\(astronauts.count)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
