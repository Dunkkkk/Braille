//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/04/09.
//

import SwiftUI
import Combine

extension TicTacToeViewModel {
    enum Player: String {
        case human = "O"
        case computer = "X"
    }

    typealias Move = (row: Int, col: Int)
    
    static func computerMove(items: [TicTacToeItem]) -> Move? {
        let temp = items.filter { $0.turn == .none }
        if temp.count == 6 || temp.count == 2 {
            let temp2 = temp.randomElement()
            let index = items.firstIndex(where: { $0 == temp2 })!
            return (index / 3, index % 3)
        }
        var array = [[String]]()
        for row in 0..<3{
            var temp = [String]()
            for col in 0..<3 {
                let index = row * 3 + col
                let currentSymbol = items[index].turn
                if currentSymbol == .user1 {
                    temp.append("O")
                }
                else if currentSymbol == .user2 {
                    temp.append("X")
                }
                else {
                    temp.append("")
                }
            }
            array.append(temp)
        }
        
        return minimax(board: array, player: .computer).move
    }

    static func minimax(board: [[String]], player: Player) -> (score: Int, move: Move?) {
        if checkWin(board: board, player: Player.computer) {
            return (10, nil)
        } else if checkWin(board: board, player: Player.human) {
            return (-10, nil)
        } else if checkTie(board: board) {
            return (0, nil)
        }
        
        var bestScore = (player == .computer) ? Int.min : Int.max
        var bestMove: Move?
        
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if board[i][j] == "" {
                    var newBoard = board
                    newBoard[i][j] = player.rawValue
                    
                    let score = minimax(board: newBoard, player: (player == .computer) ? .human : .computer).score
                    
                    if player == .computer && score > bestScore {
                        bestScore = score
                        bestMove = (i, j)
                    } else if player == .human && score < bestScore {
                        bestScore = score
                        bestMove = (i, j)
                    }
                }
            }
        }
        
        return (bestScore, bestMove)
    }

    static func checkWin(board: [[String]], player: Player) -> Bool {
        let playerMark = player.rawValue
        
        for i in 0..<board.count {
            if board[i][0] == playerMark && board[i][1] == playerMark && board[i][2] == playerMark {
                return true
            }
            if board[0][i] == playerMark && board[1][i] == playerMark && board[2][i] == playerMark {
                return true
            }
        }
        
        if board[0][0] == playerMark && board[1][1] == playerMark && board[2][2] == playerMark {
            return true
        }
        if board[0][2] == playerMark && board[1][1] == playerMark && board[2][0] == playerMark {
            return true
        }
        
        return false
    }

    static func checkTie(board: [[String]]) -> Bool {
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if board[i][j] == "" {
                    return false
                }
            }
        }
        
        return true
    }
}
