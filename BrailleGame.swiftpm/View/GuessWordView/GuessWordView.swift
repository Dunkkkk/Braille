//
//  GuessWordView.swift
//
//
//  Created by changgyo seo on 2023/04/04.
//

import SwiftUI

struct GuessWordView: View {
    
    @ObservedObject var viewmodel: GuessWordViewModel
    
    var body: some View {
        VStack {
            Spacer()
            GuessWordTitleView(words: $viewmodel.correctWord.meaning)
            Spacer()
            HStack {
                VStack {
                    Button("Hint") {
                        viewmodel.tapHint = ()
                    }
                }
                BrailleKeyPad(tapedKeys: $viewmodel.currentWord, isInteractive: true)
                    .frame(width: 200)
                VStack {
                    Button("Summit") {
                        viewmodel.tapSummit = ()
                    }
                }
            }
            .frame(width: 500, height: 500)
        }
    }
}

struct GuessWordViewPreProvider: PreviewProvider {
    static var previews: some View {
        GuessWordView(viewmodel: GuessWordViewModel())
    }
}
