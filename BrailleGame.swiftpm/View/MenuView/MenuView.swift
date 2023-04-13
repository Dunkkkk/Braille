//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/04/09.
//

import SwiftUI

struct MenuView: View {
    
    @State var goToOrigin1: Bool = false
    @State var goToOrigin2: Bool = false
    @State var goToOrigin3: Bool = false
    
    var body: some View {
        NavigationView {
            BackGroundView(isBraille: true) {
                VStack {
                    Text("What kind of game do you want?")
                        .modifier(CustomFont(fontSize: 36, hex: "#BA9309"))
                    VStack(spacing: 27){
                        HStack(spacing: 27) {
                            NavigationLink {
                                GuaidingView(viewmodel: GuaidingViewModel())
                            } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 421, height: 421)
                                            .foregroundColor(.white)
                                            .shadow(color: Color(hex: "#FAE085")!, radius: 40, x: 10, y: 15)
                                        VStack{
                                            Spacer()
                                            Image("tutorial")
                                            Spacer()
                                            Text("Tutorial")
                                                .modifier(CustomFont(fontSize: 34))
                                        }
                                        .padding(.bottom, 71)
                                        .frame(width: 421, height: 421)
                                    }
                            }

                            NavigationLink (
                                destination: CharacterChoiceView(goToOrigin: $goToOrigin1, difficulty: .twoplayer),
                                isActive: $goToOrigin1
                            ) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 421, height: 421)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: "#FAE085")!, radius: 40, x: 10, y: 15)
                                    VStack{
                                        Spacer()
                                        Image("friend")
                                        Spacer()
                                        HStack {
                                            Text("VS").modifier(CustomFont(fontSize: 34, hex: "#FAE085"))
                                            Text("Friend").modifier(CustomFont(fontSize: 34))
                                        }
                                    }
                                    .padding(.bottom, 71)
                                    .frame(width: 421, height: 421)
                                }
                            }
                            
                        }
                        HStack(spacing: 27) {
                            NavigationLink (
                                destination: CharacterChoiceView(goToOrigin: $goToOrigin2, difficulty: .easy),
                                isActive: $goToOrigin2
                            ) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 421, height: 421)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: "#FAE085")!, radius: 40, x: 10, y: 15)
                                    VStack{
                                        Spacer()
                                        Image("easy")
                                        Spacer()
                                        VStack {
                                            HStack {
                                                Text("VS").modifier(CustomFont(fontSize: 34, hex: "#FAE085"))
                                                Text("Computer").modifier(CustomFont(fontSize: 34))
                                            }
                                            Text("Easy mode")
                                                .modifier(CustomFont(fontSize: 20, hex: "#BA9309"))
                                        }
                                    }
                                    .padding(.bottom, 71)
                                    .frame(width: 421, height: 421)
                                }
                            }
                            NavigationLink (
                                destination: CharacterChoiceView(goToOrigin: $goToOrigin3, difficulty: .hard),
                                isActive: $goToOrigin3
                            ) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 421, height: 421)
                                        .foregroundColor(.white)
                                        .shadow(color: Color(hex: "#FAE085")!, radius: 40, x: 10, y: 15)
                                    VStack{
                                        Spacer()
                                        Image("hard")
                                        Spacer()
                                        VStack {
                                            HStack {
                                                Text("VS").modifier(CustomFont(fontSize: 34, hex: "#FAE085"))
                                                Text("Computer").modifier(CustomFont(fontSize: 34))
                                            }
                                            Text("Hard mode")
                                                .modifier(CustomFont(fontSize: 20, hex: "#FA8C85"))
                                        }
                                    }
                                    .padding(.bottom, 71)
                                    .frame(width: 421, height: 421)
                                }
                            }
                            
                        }
                    }
                    
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(Color(hex: "#FFC700")!)
    }
}
