//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Gleb on 24.08.2025.
//

// Model

import Foundation

// generic
struct MemoryGame<CardContent> where CardContent: Equatable {        // параметр типа (generic type parameter)
    private(set) var cards: Array<Card> // private control
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent         // то, что на самой карточке (эмодзи, картинка…)
        
        var id: String
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "no")"
        }
    }
}
