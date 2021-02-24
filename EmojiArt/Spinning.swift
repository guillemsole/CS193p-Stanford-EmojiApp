//
//  Spinning.swift
//  EmojiArt
//
//  Created by Guillem Solé Cubilo on 24/2/21.
//

import SwiftUI

struct Spinning: ViewModifier {
    @State var isVisible = false
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: isVisible ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever())
            .onAppear {isVisible = true}
    }
}

extension View {
    func spinning() -> some View {
        self.modifier(Spinning())
    }
}
