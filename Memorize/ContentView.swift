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
