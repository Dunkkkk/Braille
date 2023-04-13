//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/04/09.
//


struct TicTacToeItem: Equatable {
    
    var title: String
    var description: String
    var brailles: [Braille]
    var turn: TicTacToeTurn = .none
    
    static func ==(lhs: TicTacToeItem, rhs: TicTacToeItem) -> Bool {
        return lhs.title == rhs.title
    }
}

extension TicTacToeItem {
    
    static var wordItems: [TicTacToeItem] = [
        TicTacToeItem(title: "can",
                      description: "In Korea, canned drinks are marked as can, not the name of the drink.",
                      brailles: BrailleDictionary.wordtoBrailes("can")),
        TicTacToeItem(title: "kid",
                      description: "In USA, most blind kids can’t read braille",
                      brailles: BrailleDictionary.wordtoBrailes("kid")),
        TicTacToeItem(title: "pet",
                      description: "In Korea, plastic bottle beverages are marked as pet, not the beverage name.",
                      brailles: BrailleDictionary.wordtoBrailes("pet")),
        TicTacToeItem(title: "lot",
                      description: "16.4 million Americans aged 18 to 64 are blind, and 82% of blind people live in low-income households.",
                      brailles: BrailleDictionary.wordtoBrailes("lot")),
        TicTacToeItem(title: "nfb",
                      description: "NFB has 52 chapters in the United States and provides major programs and services.",
                      brailles: BrailleDictionary.wordtoBrailes("nfb")),
        TicTacToeItem(title: "six",
                      description: "Braille's Braille system is made up of six dots in Braille, which are designed to correspond to the six dots of the French alphabet.",
                      brailles: BrailleDictionary.wordtoBrailes("six")),
        TicTacToeItem(title: "block",
                      description: "In some areas, the absence or improper installation of braille blocks may make it difficult for blind people to move around.",
                      brailles: BrailleDictionary.wordtoBrailes("block")),
        TicTacToeItem(title: "cane",
                      description: "\"White Cane\" is a walking aid used by blind people to inform others of their location or safely cross the road.",
                      brailles: BrailleDictionary.wordtoBrailes("cane")),
        TicTacToeItem(title: "apple",
                      description: "Apple supports various features such as VoiceOver, Spoken Content, and Magnifier for the visually impaired.",
                      brailles: BrailleDictionary.wordtoBrailes("apple"))
    ]
    
    static func alphabetItems() -> [TicTacToeItem] {
        let randomAlphbet = BrailleDictionary.allCases.shuffled()
        var tictactoeItems = [TicTacToeItem]()
        
        for index in 0..<9 {
            let item = TicTacToeItem(title: randomAlphbet[index].braille.meaning.first!,
                                     description: "",
                                     brailles: [randomAlphbet[index].braille])
            tictactoeItems.append(item)
        }
        
        return tictactoeItems
    }
    
    mutating func isCorrect(who newStatus: TicTacToeTurn) {
        self.turn = newStatus
    }
}

enum TicTacToeTurn {
    case user1 // 동그라미
    case user2 // 세모(컴퓨터)
    case none
    
    mutating func toggle() {
        if self == .none || self == .user1 {
            self = .user2
        }
        else {
            self = .user1
        }
    }
}
