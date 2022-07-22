//
//  ContentView.swift
//  Memorise
//
//  Created by Ian Bailey on 26/6/2022.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🐠", "🐢", "🦋", "🐥", "🐣", "🐰", "🐝", "🦄", "🐵", "🐛", "🐌", "🕷",
                  "🦅", "🐨", "🐞", "🦎", "🐳", "🦑", "🦀", "🐊", "🐫", "🐏", "🦧", "🐘"]
    @State var emojiCount = 5
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
                    ForEach(emojis[0..<emojiCount], id: \.self)  {emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }.foregroundColor(.red)
            
            Spacer()
            
            HStack{
                buttonRemove
                Spacer()
                buttonAdd
            }.padding()
          
            .font(.largeTitle)
        }  .padding(.horizontal)
    }
    
    var buttonAdd: some View {
        Button{
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var buttonRemove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }

    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).padding()
            } else {
                shape.fill().foregroundColor(.red)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portraitUpsideDown)
                
 
        }
    }
}
