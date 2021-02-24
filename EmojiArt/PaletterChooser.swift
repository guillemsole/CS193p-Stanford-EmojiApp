//
//  PaletterChooser.swift
//  EmojiArt
//
//  Created by Guillem Solé Cubilo on 24/2/21.
//

import SwiftUI

struct PaletterChooser: View {
    @ObservedObject var document: EmojiArtDocument
    
    @Binding var chosenPalette: String
    @State private var showPaletteEditor = false
    
    var body: some View {
        HStack {
            Stepper(
                onIncrement: {
                    chosenPalette = document.palette(after: chosenPalette)
                },
                onDecrement: {
                    chosenPalette = document.palette(before: chosenPalette)
                },
                label: {
                    EmptyView()
                })
            Text(document.paletteNames[chosenPalette] ?? "")
            Image(systemName: "keyboard").imageScale(.large)
                .sheet(isPresented: $showPaletteEditor) {
                    PaletteEditor(chosenPalette: $chosenPalette, isShowing: $showPaletteEditor)
                        .environmentObject(document)
                        .frame(minWidth: 300, minHeight: 500)
                }
                .onTapGesture {
                    showPaletteEditor = true
                }
        }
        .fixedSize(horizontal: true, vertical: false)
    }
}

struct PaletteEditor: View {
    @EnvironmentObject var document: EmojiArtDocument
    
    @Binding var chosenPalette: String
    @Binding var isShowing: Bool

    @State private var paletteName: String = ""
    @State private var emojisToAdd: String = ""
    
    var body: some View {
        VStack {
            ZStack {
                Text("Palette editor").font(.headline).padding()
                HStack {
                    Spacer()
                    Button (action: {
                        isShowing = false
                    }, label: {
                        Text("Done")
                    }).padding()
                }
            }
            Divider()
            Form {
                Section {
                    TextField("Palette Name", text: $paletteName, onEditingChanged: { began in
                        if !began {
                            document.renamePalette(chosenPalette, to: paletteName)
                        }
                    })
                    TextField("Add Emoji", text: $emojisToAdd, onEditingChanged: { began in
                        if !began {
                            chosenPalette = document.addEmoji(emojisToAdd, toPalette: chosenPalette)
                            emojisToAdd = ""
                        }
                    })
                }
                Section(header: Text("Remove Emoji")) {
                    Grid(chosenPalette.map { String($0) }, id: \.self) { emoji in
                        Text(emoji)
                            .font(Font.system(size:fontSize))
                            .onTapGesture {
                                chosenPalette = document.removeEmoji(emoji, fromPalette: chosenPalette)
                            }
                    }
                    .frame(height: height)
                }
            }
        }
        .onAppear {
            paletteName = document.paletteNames[chosenPalette] ?? ""
        }
    }
    
    private var height: CGFloat {
        CGFloat((chosenPalette.count - 1) / 6) * 70 + 70
    }
    private let fontSize: CGFloat = 40
}










struct PaletterChooser_Previews: PreviewProvider {
    static var previews: some View {
        PaletterChooser(document: EmojiArtDocument(), chosenPalette: Binding.constant(""))
    }
}
