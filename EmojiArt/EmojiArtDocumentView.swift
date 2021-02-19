//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by Guillem Solé Cubilo on 19/2/21.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document: EmojiArtDocument
    
    var body: some View {
        HStack {
            ForEach(EmojiArtDocument.palette.map { String($0) }, id: \.self) { emoji in
                Text(emoji)
                
            }
        }
    }
}
