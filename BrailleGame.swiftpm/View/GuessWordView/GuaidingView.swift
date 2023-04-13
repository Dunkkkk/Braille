//
//  GuessWordView.swift
//
//
//  Created by changgyo seo on 2023/04/04.
//

import SwiftUI

struct GuaidingView: View {
    
    @ObservedObject var viewmodel: GuaidingViewModel
    @State var mode: KeyPadMode = .braille
    
    var body: some View {
        BackGroundView {
            VStack {
                HStack {
                    Spacer()
                    GuadingScoreView(brailles: $viewmodel.alphabetList, scoreList: $viewmodel.alphabetScoreList, currentIndex: $viewmodel.alphabetScoreListIndex)
                    Spacer()
                }
                GuaidingTitleView(braille: $viewmodel.correctWord)
                    .frame(width: 300, height: 300)
                HStack {
                    ZStack {
                        BrailleKeyPad(tapedKeys: $viewmodel.currentWord)
                            .frame(height: 332)
                        VStack {
                            Button {
                                viewmodel.tapSummit = ()
                            } label: {
                                Text("Next")
                                    .modifier(CustomFont(fontSize: 28, hex: "#636363"))
                            }
                            
                            Button {
                                viewmodel.tapHint = ()
                            } label: {
                                Text("Hint")
                                    .modifier(CustomFont(fontSize: 28, hex: "#FAE085"))
                            }
                            .offset(CGSize(width: 0, height: 124))
                        }
                        .offset(CGSize(width: 200, height: 20))
                    }
                    .padding(.bottom, 94)
                }
                .frame(width: 500, height: 500)
            }
        }
    }
}
