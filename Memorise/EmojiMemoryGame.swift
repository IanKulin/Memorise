//
//  EmojiMemoryGame.swift
//  Memorise - View Model
//
//  Created by Ian Bailey on 30/7/2022.
//

import SwiftUI

class EmojiMemoryGame {
    
    static let animalEmojis = ["🐠", "🐢", "🦋", "🐥", "🐣", "🐰", "🐝", "🦄", "🐵", "🐛", "🐌", "🕷",
                        "🦅", "🐨", "🐞", "🦎", "🐳", "🦑", "🦀", "🐊", "🐫", "🐏", "🦧", "🐘"]
    static let weatherEmojis = ["🌪", "🌝", "🌈", "🔥", "🌧", "🌙", "🌬", "☃️", "☔️", "🌫", "🌗", "⚡️",
                         "✨", "☀️", "⛅️", "🌊", "🥦", "🎇", "☂️", "🌤", "☄️", "🌏", "🫧", "🍎"]
    static let transportEmojis = ["🚗", "🚕", "🚲", "🚚", "🛵", "🚜", "🛴", "🛺", "🚃", "🚡", "🚂", "🚀",
                            "🛳", "✈️", "🛫", "🚤", "🛶", "🚝", "⛵️", "🚔", "🚙", "🏍", "🛸", "🚁"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) {pairIndex in
            animalEmojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
