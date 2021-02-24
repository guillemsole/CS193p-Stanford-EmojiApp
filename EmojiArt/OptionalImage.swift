//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by Guillem Solé Cubilo on 23/2/21.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}
