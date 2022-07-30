//
//  EmojiMemoryGame.swift
//  Memorise - View Model
//
//  Created by Ian Bailey on 30/7/2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🐠", "🐢", "🦋", "🐥", "🐣", "🐰", "🐝", "🦄", "🐵", "🐛", "🐌", "🕷",
                        "🦅", "🐨", "🐞", "🦎", "🐳", "🦑", "🦀", "🐊", "🐫", "🐏", "🦧", "🐘"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) {pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
