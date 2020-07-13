//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by QDSG on 2020/7/13.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16 // Int16 与CoreData的结合更加容易
    
    var body: some View {
        switch rating {
        case 1: return Text("😡").font(.largeTitle)
        case 2: return Text("😓").font(.largeTitle)
        case 3: return Text("🤔").font(.largeTitle)
        case 4: return Text("😉").font(.largeTitle)
        default: return Text("😘").font(.largeTitle)
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
