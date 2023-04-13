//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/04/11.
//

import SwiftUI

struct GuadingScoreView: View {
    
    @Binding var brailles: [Braille]
    @Binding var scoreList: [Status]
    @Binding var currentIndex: Int
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 40) {
                ForEach(0..<3) { y in
                    HStack(spacing: 48) {
                        ForEach(0..<9) { x in
                            let index = y * 9 + x
                            if index < 26 {
                                GuadingScoreAlphabetView(braille: $brailles[index], status: $scoreList[index], currentIndex: $currentIndex, index: index)
                            }
                        }
                    }
                }
            }
            .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
        }
    }
}

struct GuadingScoreAlphabetView: View {
    
    @Binding var braille: Braille
    @Binding var status: GuadingScoreView.Status
    @Binding var currentIndex: Int
    var index: Int
    
    var body: some View {
        VStack(spacing: 14) {
            Text(braille.meaning.first!)
                .font(.system(size: 36, weight: .bold, design: .default))
            
            Circle()
                .frame(width: 16, height: 16)
                .foregroundColor(status.color)
        }
        .onTapGesture {
            currentIndex = index
        }
    }
}

extension GuadingScoreView {
    
    enum Status {
        case show
        case none
        case current
        case correct
        
        var color: Color {
            switch self {
            case .none:
                return Color(hex: "#D9D9D9")!
            case .correct:
                return Color(hex: "#FAE085")!
            case .current, .show:
                return .white
            }
        }
    }
}
