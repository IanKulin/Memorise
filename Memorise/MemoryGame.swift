//
//  MemoryGame.swift
//  Memorise - model
//
//  Created by Ian Bailey on 30/7/2022.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card){
        //todo
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent ) {
        cards = Array<Card>()
        // add pairs of cards to array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}
