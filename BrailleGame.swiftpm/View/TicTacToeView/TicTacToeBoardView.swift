//
//  File.swift
//
//
//  Created by changgyo seo on 2023/04/05.
//

import SwiftUI

struct TicTacToeBoardView: View {
    
    @Binding var tictactoeItems: [TicTacToeItem]
    var user1: String
    var user2: String
    let boardPaths: [[[PathView.Direction]]] = [
        [[.right, .down],[.left, .right, .down], [.left, .down]],
        [[.up,.right,.down], [.left, .right, .up, .down], [.up, .left, .down]],
        [[.up,.right], [.up,.left, .right], [.up,.left]]
    ]
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                ForEach(0..<3) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<3) { col in
                            ZStack {
                                let index = row * 3 + col
                                
                                Rectangle()
                                    .frame(width: proxy.size.width / 3, height: proxy.size.width / 3)
                                    .foregroundColor(.clear)
                                    .overlay(PathView(directions: boardPaths[row][col], size: Int(proxy.size.width / 3)))
                                    
                                let textSize = tictactoeItems[index].title.count > 1 ? 40 : 60
                                Text(tictactoeItems[index].title)
                                    .font(.system(size: CGFloat(textSize), weight: .semibold, design: .default))
                                
                                if tictactoeItems[index].turn == .user1 {
                                    Image(user1)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: proxy.size.width / 5, height: proxy.size.width / 5)
                                }
                                else if tictactoeItems[index].turn == .user2 {
                                    Image(user2)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: proxy.size.width / 5, height: proxy.size.width / 5)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
