//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/04/12.
//

import SwiftUI

struct ResultView: View {
    
    var iswin: Bool
    var charName: String
    var displayName: String = "ME"
    @Binding var goToOrigin: Bool
    
    var body: some View {
        BackGroundView {
            ZStack {
                Image(iswin ? "winBack" : "loseBack")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                
                VStack {
                    Spacer()
                    
                    if displayName == "" {
                        Text("Draw")
                            .font(.system(size: 64, weight: .bold, design: .default))
                            .foregroundColor(.blue)
                    }
                    else {
                        Text(iswin ? " YOU WIN" : "YOU LOSE")
                            .font(.system(size: 64, weight: .bold, design: .default))
                            .foregroundColor(iswin ? Color(hex: "EA1212") : .black)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 306, height: 306)
                            .foregroundColor(.white)
                            .shadow(color: Color(hex: "#FAE085")!, radius: 40, x: 10, y: 15)
                        Image(charName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                    }
                    Text(displayName)
                        .font(.system(size: 34, weight: .heavy, design: .default))
                        .foregroundColor( .black)
                    Spacer()
                    ZStack {
                        Circle()
                            .frame(width: 126, height: 126)
                            .foregroundColor(.white)
                            .shadow(color: Color(hex: "#FAE085")!, radius: 40, x: 10, y: 15)
                        
                        Text("QUIT")
                            .font(.system(size: 23, weight: .black, design: .default))
                            .foregroundColor(Color(hex: "#BA9309")!.opacity(0.5))
                    }
                    .onTapGesture {
                        goToOrigin = false
                    }
                }
                .padding(.bottom, 94)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
