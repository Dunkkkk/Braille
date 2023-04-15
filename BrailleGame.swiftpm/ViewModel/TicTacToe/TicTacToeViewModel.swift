//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/04/09.
//

import SwiftUI
import Combine

class TicTacToeViewModel: ObservableObject {
    
    private var cancelBag = Set<AnyCancellable>()
    
    //MARK: only use viewmodel
    @Published var checkFinished: Void = ()
    @Published var whoseTurn: TicTacToeTurn = .user1
    var difficulty: Difficulty
    
    //MARK: input
    @Published var tictactoeItems: [TicTacToeItem] = TicTacToeItem.wordItems
    @Published var viewWillDisappear: Void = ()
    @Published var currentBraille: Braille = Braille.emptyBraille
    @Published var currentBrailles: [Braille] = [Braille]()
    @Published var tapSummit: Bool = false
    @Published var tapNext: Void = ()
    
    //MARK: output
    @Published var currentWord: String = ""
    @Published var winner: TicTacToeTurn = .none
    @Published var currentDescription: String = ""
    @Published var winnerInfo: (Bool, String) = (false, "")
    @Published var isFinished: Bool = false
    
    
    init(difficulty: Difficulty, withComputer: Bool = true) {
        
        self.difficulty = difficulty
        tictactoeItems = difficulty == .hard ? TicTacToeItem.wordItems : TicTacToeItem.alphabetItems()
        
        $checkFinished
            .eraseToAnyPublisher()
            .dropFirst()
            .sink { [weak self] _ in
                guard let self = self else { return }
                
                
                
                if self.tictactoeItems[0].turn != .none
                    && self.tictactoeItems[1].turn == self.tictactoeItems[0].turn
                    && self.tictactoeItems[2].turn == self.tictactoeItems[1].turn {
                    self.winner = self.tictactoeItems[0].turn
                    var winner1 = false
                    if difficulty == .twoplayer || self.winner == .user1 {
                        winner1 = true
                    }
                   
                    var diplayName = ""
                    if difficulty != .twoplayer || self.winner == .user1 {
                        diplayName = "ME"
                    }
                    else {
                        diplayName = "Computer"
                    }
                    self.winnerInfo = (winner1, diplayName)
                    self.isFinished = true
                }
                if self.tictactoeItems[3].turn != .none
                    && self.tictactoeItems[3].turn == self.tictactoeItems[4].turn
                    && self.tictactoeItems[4].turn == self.tictactoeItems[5].turn {
                    self.winner = self.tictactoeItems[3].turn
                    var winner1 = false
                    if difficulty == .twoplayer || self.winner == .user1 {
                        winner1 = true
                    }
                   
                    var diplayName = ""
                    if difficulty != .twoplayer || self.winner == .user1 {
                        diplayName = "ME"
                    }
                    else {
                        diplayName = "Computer"
                    }
                    self.winnerInfo = (winner1, diplayName)
                    self.isFinished = true
                }
                if self.tictactoeItems[6].turn != .none
                    && self.tictactoeItems[6].turn == self.tictactoeItems[7].turn
                    && self.tictactoeItems[7].turn == self.tictactoeItems[8].turn {
                    self.winner = self.tictactoeItems[0].turn
                    var winner1 = false
                    if difficulty == .twoplayer || self.winner == .user1 {
                        winner1 = true
                    }
                   
                    var diplayName = ""
                    if difficulty != .twoplayer || self.winner == .user1 {
                        diplayName = "ME"
                    }
                    else {
                        diplayName = "Computer"
                    }
                    self.winnerInfo = (winner1, diplayName)
                    self.isFinished = true
                }
                if self.tictactoeItems[0].turn != .none
                    && self.tictactoeItems[0].turn == self.tictactoeItems[3].turn
                    && self.tictactoeItems[3].turn == self.tictactoeItems[6].turn {
                    self.winner = self.tictactoeItems[0].turn
                    var winner1 = false
                    if difficulty == .twoplayer || self.winner == .user1 {
                        winner1 = true
                    }
                   
                    var diplayName = ""
                    if difficulty != .twoplayer || self.winner == .user1 {
                        diplayName = "ME"
                    }
                    else {
                        diplayName = "Computer"
                    }
                    self.winnerInfo = (winner1, diplayName)
                    self.isFinished = true
                }
                if self.tictactoeItems[1].turn != .none
                    && self.tictactoeItems[1].turn == self.tictactoeItems[4].turn
                    && self.tictactoeItems[4].turn == self.tictactoeItems[7].turn {
                    self.winner = self.tictactoeItems[1].turn
                    var winner1 = false
                    if difficulty == .twoplayer || self.winner == .user1 {
                        winner1 = true
                    }
                   
                    var diplayName = ""
                    if difficulty != .twoplayer || self.winner == .user1 {
                        diplayName = "ME"
                    }
                    else {
                        diplayName = "Computer"
                    }
                    self.winnerInfo = (winner1, diplayName)
                    self.isFinished = true
                }
                if self.tictactoeItems[2].turn != .none
                    && self.tictactoeItems[2].turn == self.tictactoeItems[5].turn
                    && self.tictactoeItems[5].turn == self.tictactoeItems[8].turn {
                    self.winner = self.tictactoeItems[2].turn
                    var winner1 = false
                    if difficulty == .twoplayer || self.winner == .user1 {
                        winner1 = true
                    }
                   
                    var diplayName = ""
                    if difficulty != .twoplayer || self.winner == .user1 {
                        diplayName = "ME"
                    }
                    else {
                        diplayName = "Computer"
                    }
                    self.winnerInfo = (winner1, diplayName)
                    self.isFinished = true
                }
                if self.tictactoeItems[0].turn != .none
                    && self.tictactoeItems[0].turn == self.tictactoeItems[4].turn
                    && self.tictactoeItems[4].turn == self.tictactoeItems[8].turn {
                    self.winner = self.tictactoeItems[0].turn
                    var winner1 = false
                    if difficulty == .twoplayer || self.winner == .user1 {
                        winner1 = true
                    }
                   
                    var diplayName = ""
                    if difficulty != .twoplayer || self.winner == .user1 {
                        diplayName = "ME"
                    }
                    else {
                        diplayName = "Computer"
                    }
                    self.winnerInfo = (winner1, diplayName)
                    self.isFinished = true    
                }
                if self.tictactoeItems[2].turn != .none
                    && self.tictactoeItems[2].turn == self.tictactoeItems[4].turn
                    && self.tictactoeItems[4].turn == self.tictactoeItems[6].turn {
                    self.winner = self.tictactoeItems[2].turn
                    var winner1 = false
                    if difficulty == .twoplayer || self.winner == .user1 {
                        winner1 = true
                    }
                   
                    var diplayName = ""
                    if difficulty != .twoplayer || self.winner == .user1 {
                        diplayName = "ME"
                    }
                    else {
                        diplayName = "Computer"
                    }
                    self.winnerInfo = (winner1, diplayName)
                    self.isFinished = true
                }
                
                let temp = self.tictactoeItems.filter { $0.turn == .none }
                if temp.count == 0 {
                    self.winnerInfo = (true, "")
                    self.isFinished = true
                }
            }
            .store(in: &cancelBag)
    
        $tapNext
            .eraseToAnyPublisher()
            .dropFirst()
            .sink { [weak self] _ in
                guard let self = self else { return }
                
                if let braille = BrailleDictionary.isHere(it: self.currentBraille) {
                    self.currentBrailles.append(braille)
                    self.currentBraille = Braille.emptyBraille
                }
            }
            .store(in: &cancelBag)
        
        $tapSummit
            .eraseToAnyPublisher()
            .dropFirst()
            .sink { [weak self] isComputer in
                guard let self = self else { return }
                
                if isComputer {
                    if self.whoseTurn == .user2 {
                        if let computerPosition = TicTacToeViewModel.computerMove(items: self.tictactoeItems) {
                            let index = computerPosition.row * 3 + computerPosition.col
                            self.tictactoeItems[index].turn = .user2
                        }
                    }
                }
                else {
                    for item in self.tictactoeItems.enumerated() {
                        if item.element.brailles == self.currentBrailles && self.tictactoeItems[item.offset].turn == .none{
                            self.tictactoeItems[item.offset].turn = self.whoseTurn
                            if difficulty == .hard { self.currentDescription = self.tictactoeItems[item.offset].description } 
                            self.currentBrailles = [Braille]()
                            self.checkFinished = ()
                        }
                    }
                }
                var user2Count = 0
                var user1Count = 0
                for item in self.tictactoeItems {
                    if item.turn == .user1 { user1Count += 1}
                    else if item.turn == .user2 { user2Count += 1}
                }
                if user2Count == user1Count { self.whoseTurn = .user1 }
                else if !self.isFinished  {
                    self.whoseTurn = .user2
                    if self.difficulty != .twoplayer {
                        
                        self.tapSummit = true
                        self.checkFinished = ()
                    }
                }
            }
            .store(in: &cancelBag)
        
        $currentBrailles
            .eraseToAnyPublisher()
            .dropFirst()
            .sink { [weak self] brailes in
                guard let self = self else { return }
                
                let temp = brailes.map { $0.meaning.first! }
                var str = ""
                for i in temp { str.append(i) }
                self.currentWord = str
                print(str)
            }
            .store(in: &cancelBag)
        
        $viewWillDisappear
            .eraseToAnyPublisher()
            .dropFirst()
            .sink { [weak self]_ in
                guard let self = self else { return }
                if self.difficulty == .hard {
                    self.tictactoeItems = self.tictactoeItems.shuffled()
                }
                else {
                    self.tictactoeItems = TicTacToeItem.alphabetItems()
                }
            }
            .store(in: &cancelBag)
        
    }
}

extension TicTacToeViewModel {
    
    enum Difficulty {
        case easy
        case hard
        case twoplayer
    }
}
