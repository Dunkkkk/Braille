//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/04/09.
//

import SwiftUI

struct TicTacToeView: View {
    
    @ObservedObject var viewmodel: TicTacToeViewModel
    @State private var showGuadingBook: Bool = false
    @Binding var goToOrigin: Bool
    var user1: String
    var user2: String
    
    var body: some View {
        BackGroundView {
            ZStack{
                NavigationLink(
                    destination: ResultView(iswin: viewmodel.winnerInfo.0,
                                            charName: viewmodel.winner == .user1 ? user1 : user2,
                                            displayName: viewmodel.winnerInfo.1,
                                            goToOrigin: $goToOrigin),
                    isActive: $viewmodel.isFinished
                ) {
                    EmptyView()
                }
                
                ZStack(alignment: .top) {
                    HStack {
                        Spacer()
                        Button {
                            showGuadingBook.toggle()
                        } label: {
                            Image(systemName: "folder.fill")
                                .resizable()
                                .frame(width: 59, height: 43)
                        }
                    }
                    .padding(60)
                    VStack{
                        TicTacToeBoardView(tictactoeItems: $viewmodel.tictactoeItems, user1: user1, user2: user2)
                            .frame(width: 546, height: 546)
                        Spacer()
                        if viewmodel.difficulty == .hard {
                            VStack {
                                Text("Do You Know?")
                                    .font(.system(size: 24, weight: .regular, design: .rounded))
                                    .foregroundColor(.gray)
                                Text(viewmodel.currentDescription)
                                    .font(.system(size: 24, weight: .regular, design: .rounded))
                                    .multilineTextAlignment(.center)
                            }
                            .offset(y: -50)
                        }
                        else if viewmodel.difficulty == .twoplayer {
                            HStack(spacing: 100) {
                                Image(user1)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 77, height: 77)
                                    .opacity(viewmodel.whoseTurn == .user1 ? 1 : 0.4)
                                Text(viewmodel.whoseTurn == .user1 ? "User1 Turn" : "User2 Turn")
                                    .font(.system(size: 24, weight: .bold, design: .default))
                                    .foregroundColor(Color(hex: "#BA9309")!)
                                Image(user2)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 77, height: 77)
                                    .opacity(viewmodel.whoseTurn == .user2 ? 1 : 0.4)
                            }
                            .offset(y: -50)
                        }
                        Spacer()
                        ZStack(alignment: .trailing) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .shadow(color: Color(hex: "#FAE085")!, radius: 20, x: 0, y: 0)
                                    .foregroundColor(.white)
                                    .frame(width: 546, height: 96)
                                Text(viewmodel.difficulty == .hard ? viewmodel.currentWord : BrailleDictionary.dotsToAlphabet(viewmodel.currentBraille.dots))
                                    .font(.system(size: 40, weight: .bold, design: .rounded))
                            }
                            if viewmodel.difficulty == .hard {
                                
                                Button {
                                    viewmodel.tapSummit = false
                                } label: {
                                    Image(systemName: "arrowshape.right.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 64, height: 38)
                                        
                                }
                                .offset(x: -20)
                            }
                        }
                        .frame(width: 546, height: 96)
                        .offset(y: -100)
                        keypad
                    }
                    .padding(.bottom, 94)
                    .padding(.trailing, 94)
                    .padding(.leading, 94)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    if viewmodel.winner != .none {
                        RoundedRectangle(cornerRadius: 20)
                            .opacity(0.5)
                            .frame(width: 1000, height: 1000)
                    }
                }
                .padding(.top, 74)
                .padding(60)
                .onDisappear {
                    viewmodel.viewWillDisappear = ()
                }
                if showGuadingBook {
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.01))
                        .onTapGesture {
                            showGuadingBook.toggle()
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                            .frame(width: 800, height: 800)
                            .shadow(color: Color(hex: "#FAE085")!, radius: 40, x: 10, y: 15)
                        Image("GuidingBook")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 600)
                        VStack {
                            Text("GuidingBook!")
                                .font(.system(size: 36, weight: .bold, design: .default))
                                .foregroundColor(Color(hex: "FAE085")!)
                            Spacer()
                        }
                        .frame(width: 750, height: 750)
                        .padding(24)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var keypad: some View {
        ZStack {
            BrailleKeyPad(tapedKeys: $viewmodel.currentBraille, isInteractive: !showGuadingBook)
                .frame(height: 332)
            VStack {
                Button {
                    if viewmodel.difficulty == .hard {
                        viewmodel.currentBrailles.popLast()
                    }
                } label: {
                    Image(systemName: "arrowshape.backward.fill")
                        .modifier(CustomFont(fontSize: 28, hex: "#636363"))
                        .foregroundColor(viewmodel.difficulty == .hard ? .black : .clear)
                }
                .offset(CGSize(width: 0, height: -124))
                
                Button {
                    viewmodel.tapNext = ()
                    if viewmodel.difficulty != .hard { viewmodel.tapSummit = false }
                } label: {
                    Text(viewmodel.difficulty != .hard ? "Summit" : "Next")
                        .modifier(CustomFont(fontSize: 28, hex: "#636363"))
                }
            }
            .offset(CGSize(width: 200, height: -14))
        }
        .padding(.bottom, 94)
    }
}
