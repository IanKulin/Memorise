//
//  ContentView.swift
//  Memorise
//
//  Created by Ian Bailey on 26/6/2022.
//

import SwiftUI

struct ContentView: View {
    let animalEmojis = ["🐠", "🐢", "🦋", "🐥", "🐣", "🐰", "🐝", "🦄", "🐵", "🐛", "🐌", "🕷",
                        "🦅", "🐨", "🐞", "🦎", "🐳", "🦑", "🦀", "🐊", "🐫", "🐏", "🦧", "🐘"]
    let weatherEmojis = ["🌪", "🌝", "🌈", "🔥", "🌧", "🌙", "🌬", "☃️", "☔️", "🌫", "🌗", "⚡️",
                         "✨", "☀️", "⛅️", "🌊", "🥦", "🎇", "☂️", "🌤", "☄️", "🌏", "🫧", "🍎"]
    let transportEmojis = ["🚗", "🚕", "🚲", "🚚", "🛵", "🚜", "🛴", "🛺", "🚃", "🚡", "🚂", "🚀",
                            "🛳", "✈️", "🛫", "🚤", "🛶", "🚝", "⛵️", "🚔", "🚙", "🏍", "🛸", "🚁"]


    // I'm not happy with this duplication //TODO
    @State var emojis = ["🐠", "🐢", "🦋", "🐥", "🐣", "🐰", "🐝", "🦄", "🐵", "🐛", "🐌", "🕷",
                         "🦅", "🐨", "🐞", "🦎", "🐳", "🦑", "🦀", "🐊", "🐫", "🐏", "🦧", "🐘"]
    
    @State var emojiCount = 16
    
    // used for SF Symbol frames
    @ScaledMetric var height: CGFloat = 20
    
    var body: some View {
        VStack{
            Text("Memorise!")
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
                Spacer()
                buttonThemeAnimal
                Spacer()
                buttonThemeWeather
                Spacer()
                buttonThemeTransport
                Spacer()
            }
        }  .padding(.horizontal).font(.largeTitle)
    }
    
    var buttonThemeAnimal: some View {
        VStack{
            Button{
                emojis = animalEmojis
                emojis.shuffle()
            } label: { Image(systemName: "ant").frame(height: height)}
            Text("Animals").font(.body)
        }
    }
    
    var buttonThemeWeather: some View {
        VStack{
            Button {
                emojis = weatherEmojis
                emojis.shuffle()
            } label: { Image(systemName: "cloud").frame(height: height)}
            Text("Weather").font(.body)
        }
    }
    
    var buttonThemeTransport: some View {
        VStack{
            Button {
                emojis = transportEmojis
                emojis.shuffle()
            } label: { Image(systemName: "car").frame(height: height)}
            Text("Transport").font(.body)
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
                .previewInterfaceOrientation(.portrait)
                
 
        }
    }
}
