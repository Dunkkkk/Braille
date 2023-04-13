//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/04/11.
//

import SwiftUI

struct CharacterChoiceView: View {
    
    @State var user1: String = ""
    @State var user2: String = ""
    @State var char1Finish: Bool = false
    @State var char2Finish: Bool = false
    @State var char3Finish: Bool = false
    @Binding var goToOrigin: Bool
    var difficulty: TicTacToeViewModel.Difficulty
    
    
    var body: some View {
        BackGroundView {
            VStack {
                Spacer()
                HStack(spacing: 84) {
                    VStack(spacing: 32) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 306, height: 306)
                                .foregroundColor(.white)
                                .shadow(color: Color(hex: "#FAE085")!, radius: 40, x: 10, y: 15)
                            Image(user1)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                            
                        }
                        Text(difficulty != .twoplayer ? "ME" : "User1")
                            .font(.system(size: 34, weight: .bold, design: .default))
                    }
                    
                    
                    Text("VS")
                        .font(.system(size: 34, weight: .bold, design: .default))
                        .foregroundColor( Color(hex: "#FAE085")!)
                    VStack(spacing: 32) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 306, height: 306)
                                .foregroundColor(.white)
                                .shadow(color: Color(hex: "#FAE085")!, radius: 40, x: 10, y: 15)
                            Image(user2)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                            
                        }
                        Text(difficulty != .twoplayer ? "Computer" : "User2")
                            .font(.system(size: 34, weight: .bold, design: .default))
                    }
                }
                Spacer(minLength: 105)
                HStack(alignment: .bottom, spacing: 60){
                    Image("char1")
                        .resizable()
                        .frame(width: 81, height: 81)
                        .onTapGesture {
                            if char1Finish == false {
                                if user1 == "" {
                                    user1 = "char1"
                                    char1Finish = true
                                }
                                else if user2 == "" {
                                    char1Finish = true
                                    user2 = "char1"
                                }
                            }
                        }
                        .opacity(char1Finish ? 0.3 : 1)
                    Image("char2")
                        .resizable()
                        .frame(width: 81, height: 130)
                        .onTapGesture {
                            if char2Finish == false {
                                if user1 == "" {
                                    char2Finish = true
                                    user1 = "char2"
                                }
                                else if user2 == "" {
                                    char2Finish = true
                                    user2 = "char2"
                                }
                            }
                        }
                        .opacity(char2Finish ? 0.3 : 1)
                    Image("char3")
                        .resizable()
                        .frame(width: 134, height: 130)
                        .onTapGesture {
                            if char3Finish == false {
                                if user1 == "" {
                                    char3Finish = true
                                    user1 = "char3"
                                }
                                else if user2 == "" {
                                    char3Finish = true
                                    user2 = "char3"
                                }
                            }
                            
                        }
                        .opacity(char3Finish ? 0.3 : 1)
                }
                Text("Please select a character")
                    .foregroundColor(Color(hex: "#BA9309")!)
                    .font(.system(size: 25, weight: .bold, design: .default))
                Spacer(minLength: 152)
                NavigationLink {
                    if user1 != "" && user2 != "" {
                        TicTacToeView(viewmodel: TicTacToeViewModel(difficulty: difficulty, withComputer: difficulty == .twoplayer ? false : true), goToOrigin: $goToOrigin, user1: user1, user2: user2)
                    }
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 126, height: 126)
                            .foregroundColor(.white)
                            .shadow(color: Color(hex: "#FAE085")!, radius: 40, x: 10, y: 15)
                        Text("GAME\nSTART")
                            .font(.system(size: 23, weight: .black, design: .default))
                            .foregroundColor(Color(hex: "#BA9309")!.opacity(0.5))
                    }
                    
                }
                
            }
            .padding(.bottom, 94)
        }
    }
}
