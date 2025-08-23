//
//  ContentView.swift
//  Memorize
//
//  Created by Gleb on 23.08.2025.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🕷️", "🎃", "👿"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFacedUp = true
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 50)
        
        ZStack {
            if isFacedUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 10)
                Text("👻")
                    .font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFacedUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
