//
//  MemoryGame.swift
//  Memorise - model
//
//  Created by Ian Bailey on 30/7/2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private var indexOfSingleFaceUpCard: Int?
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            
            // the card we were passed is in the array, so get to work
            if let potentialMatchIndex = indexOfSingleFaceUpCard {
                // there was already one face up card, so check if it matches
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    // we found a match
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                // there are now two face up cards
                indexOfSingleFaceUpCard = nil
            } else {
                // there is two face up cards, so turn them all down
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                // this is the card we just clicked on
                indexOfSingleFaceUpCard = chosenIndex
            }
            
            // turn the clicked on card face up
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent ) {
        cards = Array<Card>()
        // add pairs of cards to array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
            
        }
    }
    
    struct Card :Identifiable {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}
