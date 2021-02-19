//
//  ContentView.swift
//  EmojiArt
//
//  Created by Guillem Solé Cubilo on 19/2/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var document: EmojiArtDocument
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}
