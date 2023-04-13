//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/03/20.
//

import SwiftUI
import Combine

class GuaidingViewModel: ObservableObject {
    
    private var cancelBag = Set<AnyCancellable>()
    
    //MARK: input
    @Published var currentWord: Braille = BrailleDictionary.emptyBraille
    @Published var tapHint: Void = ()
    @Published var tapSummit: Void = ()
    @Published var tapChangeGameMode: Void = ()
    @Published var alphabetScoreList: [GuadingScoreView.Status] = Array(repeating: GuadingScoreView.Status.none, count: 26)
    @Published var alphabetScoreListIndex: Int = 0
    @Published var alphabetList: [Braille] = BrailleDictionary.allCases.map{ $0.braille }
    
    //MARK: output
    @Published var correctWord: Braille = BrailleDictionary.allCases[0].braille
    
    init() {
        
        $alphabetScoreListIndex
            .eraseToAnyPublisher()
            .sink { [weak self] index in
                guard let self = self else { return }
                self.correctWord = self.alphabetList[index]
                self.currentWord = BrailleDictionary.emptyBraille
                self.alphabetScoreList[index] = .current
                
                for idx in 0..<self.alphabetScoreList.count {
                    if self.alphabetScoreList[idx] == .current && idx != index {
                        self.alphabetScoreList[idx] = .none
                    }
                }
            }
            .store(in: &cancelBag)
        
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
                
                if self.correctWord == self.currentWord {
                    self.alphabetScoreList[self.alphabetScoreListIndex] = .correct
                    self.alphabetScoreListIndex += 1
                }
                else {}
            })
            .store(in: &cancelBag)

    }
}
