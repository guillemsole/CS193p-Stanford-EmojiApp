//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Guillem Solé Cubilo on 19/2/21.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentChooser().environmentObject(EmojiArtDocumentStore(named: "Emoji Art"))
        }
    }
}
