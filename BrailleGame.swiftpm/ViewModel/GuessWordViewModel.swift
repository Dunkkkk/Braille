//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/03/20.
//

import SwiftUI
import Combine

class GuessWordViewModel: ObservableObject {
    
    private var cancelBag = Set<AnyCancellable>()
    
    static var Testbraille: Braille = Braille(meaning: [""], dotNumber: [1,6,5])
    @Published private var currentIndex: Int = 0
    
    //input
    @Published var currentWord: Braille = BrailleDictionary.emptyBraille
    @Published var tapHint: Void = ()
    @Published var tapSummit: Void = ()
    
    //output
    @Published var correctWord: Braille = BrailleDictionary.allCases[0].braille
    
    init() {
        $tapHint
            .eraseToAnyPublisher()
            .dropFirst()
            .sink(receiveValue: { [weak self] _ in
                guard let self = self else { return }

                let fixed: (status: DotStatus, index: Int) = self.correctWord.hint(dots: self.currentWord.dots)
                self.currentWord.dots[fixed.index].status = fixed.status
            })
            .store(in: &cancelBag)
        
        $tapSummit
            .eraseToAnyPublisher()
            .dropFirst()
            .sink(receiveValue: { [weak self] _ in
                guard let self = self else { return }
                
                if self.correctWord == self.currentWord { self.currentIndex += 1 }
                else {}
            })
            .store(in: &cancelBag)
        
        $currentIndex
            .eraseToAnyPublisher()
            .dropFirst()
            .sink(receiveValue: { [weak self] index in
                guard let self = self else { return }

                self.correctWord = BrailleDictionary.allCases[index].braille
            })
            .store(in: &cancelBag)
    }
}

// 해당 점자가 어떤 글자인지
//guard let self = self else { return }
//
//let ans = BrailleDictionary.allCases.map { $0.braille }.filter { $0 == self.currentWord }
//if let answers = ans.first?.meaning { print(answers) }
//else { print("none") }
