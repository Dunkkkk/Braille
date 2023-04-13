//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/04/10.
//

import SwiftUI

struct BackGroundView<answer>: View where answer : View {
    
    var isBraille: Bool = false
    var content: () -> answer
    
    var body: some View {
        ZStack {
//            ZStack(alignment: .top) {
//                LinearGradient(gradient: Gradient(colors: [Color(hex: "#FAF2D7")!, Color(hex: "#F0F0F0")!]),
//                               startPoint: .top,endPoint: .bottom)
//
//                Image("BrailleBackGround")
//                    .opacity(isBraille ? 0.05 : 0)
//            }
            Image("Back")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(Color(hex: "#FEFAEA").edgesIgnoringSafeArea(.top))
                .background(Color(hex: "#F0F0F0").edgesIgnoringSafeArea(.bottom))
            content()
        }
//        .edgesIgnoringSafeArea(.top)
//        .background(Color(hex: "#FAF2D7").edgesIgnoringSafeArea(.top))
//        .background(Color(hex: "#F0F0F0").edgesIgnoringSafeArea(.bottom))
    }
}

