//
//  ContentView.swift
//  Shared
//
//  Created by Les Poltrack on 10/16/21.
//

import SwiftUI

struct ContentView: View {

    let screenWidth: CGFloat // use to size the cells based on teh size of the screen
    let cellWidth: CGFloat // Width of each Cell
    let cellHeight: CGFloat // Width of each Cell
    let cellSpacing: CGFloat // space cells apart same horizontally and vertically
    let gridItems: [GridItem]
    let dogKeys = ["airedale_terrier", "american_foxhound","dutch_shepherd",
                   "havanese", "labrador_puppy", "leonberger",
                   "mudi", "norwegian_lundehund", "old_labrador",
                   "pharaoh_hound", "scottish_terrier", "tosa"
        ]
    
    // INIT sets up the cell sizes based on the size of the screen
    init() {
//        if UIDevice.current.userInterfaceIdiom == .mac {
 //           screenWidth = 1000.0
   //     } else {
            screenWidth = UIScreen.main.bounds.width // works, but not compatible with Mac
     //   }
        cellWidth = screenWidth * 0.3 // Have each about 1/3 of screen wide
        cellSpacing = screenWidth * 0.05 // take up remaining space with void
        cellHeight = cellWidth * 2.0 / 3.0 // Pics are 3:2 aspect ratio
        let dogGriditem = GridItem(.fixed(cellWidth), spacing: cellSpacing, alignment: .center)
        
        gridItems = [dogGriditem, dogGriditem, dogGriditem] // 3 cells wide
        
        
    }
    // BODY
    var body: some View {
        ScrollView(.horizontal){
            LazyVGrid(columns: gridItems, alignment: .leading, spacing: cellSpacing) {
                ForEach(dogKeys, id:\.self) { dogKey in
                    CardView(image: dogKey, height: cellHeight, width: cellWidth)
                        .onTapGesture {
                        }
                }
            }
            
        }
    }
    struct CardView: View {
        var image: String
        let height: CGFloat
        let width: CGFloat
        @State var isFaceUp: Bool = true
        
        init(image: String, height: CGFloat, width: CGFloat) {
            self.image = image
            self.height = height
            self.width = width
        }
        var body: some View {
            ZStack {
                Image(image).resizable().scaledToFit()
                Rectangle().foregroundColor(.blue)
                    .frame(width: width, height: height)
                    .opacity(isFaceUp ? 0 : 1)
            }
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
