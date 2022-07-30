//
//  MemoriseApp.swift
//  Memorise
//
//  Created by Ian Bailey on 26/6/2022.
//

import SwiftUI

@main
struct MemoriseApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
