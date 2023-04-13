//
//  GuessWordTitleView.swift
//
//
//  Created by changgyo seo on 2023/04/04.
//

import SwiftUI

struct GuaidingTitleView: View {
    
    @Binding var braille: Braille
    
    var body: some View {
        VStack {
            Text(braille.meaning.first!)
                .font(.system(size: 128, weight: .bold, design: .default))
                .underline(true, color: .white)
            
            Spacer()
                .frame(height: 40)
            
            Text("Convert the alphabet to Brailleo ")
                .frame(width: 400)
                .font(.system(size: 24, weight: .regular, design: .default))
                .foregroundColor(Color(hex: "#C8C8C8")!)
        }
    }
}
