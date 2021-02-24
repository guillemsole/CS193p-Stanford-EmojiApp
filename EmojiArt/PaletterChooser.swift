//
//  PaletterChooser.swift
//  EmojiArt
//
//  Created by Guillem Solé Cubilo on 24/2/21.
//

import SwiftUI

struct PaletterChooser: View {
    @ObservedObject var document: EmojiArtDocument
    
    @Binding var chosenPallet: String
    
    var body: some View {
        HStack {
            Stepper(
                onIncrement: {
                    chosenPallet = document.palette(after: chosenPallet)
                },
                onDecrement: {
                    chosenPallet = document.palette(before: chosenPallet)
                },
                label: {
                    EmptyView()
                })
            Text(document.paletteNames[chosenPallet] ?? "")
        }
        .fixedSize(horizontal: true, vertical: false)
    }
}

struct PaletterChooser_Previews: PreviewProvider {
    static var previews: some View {
        PaletterChooser(document: EmojiArtDocument(), chosenPallet: Binding.constant(""))
    }
}
