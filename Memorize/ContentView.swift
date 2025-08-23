//
//  ContentView.swift
//  Memorize
//
//  Created by Gleb on 23.08.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView(isFacedUp: true)
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFacedUp: Bool = false
    
    var body: some View {
        ZStack(content: {
            if isFacedUp {
                RoundedRectangle(cornerRadius: 50)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 50)
                    .strokeBorder(lineWidth: 10)
                Text("👻")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 50)
            }
        })
    }
}

#Preview {
    ContentView()
}

