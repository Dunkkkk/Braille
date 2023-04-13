//
//  SwiftUIView.swift
//  
//
//  Created by changgyo seo on 2023/03/20.
//

import SwiftUI

struct BrailleKeyPad: View {
    
    @Binding var tapedKeys: Braille
    var isInteractive: Bool = true
    var isFirst: Bool = false
    
    var body: some View {
        VStack(spacing: 27) {
            HStack(spacing: 21) {
                BrailleKey(dot: $tapedKeys.dots[0], isInteractive: isInteractive)
                BrailleKey(dot: $tapedKeys.dots[1], isInteractive: isInteractive)
            }
            HStack(spacing: 21) {
                BrailleKey(dot: $tapedKeys.dots[2], isInteractive: isInteractive)
                BrailleKey(dot: $tapedKeys.dots[3], isInteractive: isInteractive)
            }
            HStack(spacing: 21) {
                ZStack {
                    if isFirst {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 127, height: 127)
                    }
                    BrailleKey(dot: $tapedKeys.dots[4], isInteractive: isFirst ? true : isInteractive)
                        .opacity(isFirst ? 0 : 1)
                    if isFirst {
                        Text("START")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(Color(hex: "#BA9309")!)
                    }
                }
                BrailleKey(dot: $tapedKeys.dots[5], isInteractive: isInteractive)
            }
        }
    }
    
    func sizeToFit(proxySize: CGSize) -> CGFloat {
        return proxySize.height / 3
    }
}
