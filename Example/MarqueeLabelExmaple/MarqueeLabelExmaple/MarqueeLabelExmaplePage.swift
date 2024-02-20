//
//  MarqueeLabelExmaplePage.swift
//  MarqueeLabelExmaple
//
//  Created by 최최광현 on 2/20/24.
//

import SwiftUI
import MarqueeLabel

struct MarqueeLabelExmaplePage: View {
    
    @State
    var playing: Bool = false
    
    var body: some View {
        VStack {
        MarqueeLabelUI(title: "test", play: $playing)
            Button(action: {
                playing = true
            }, label: {
                Text("Play")
            })
        }
    }
}

#Preview {
    MarqueeLabelExmaplePage()
}
