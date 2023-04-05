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
    
    var body: some View {
        VStack{
            HStack {
                BrailleKey(dot: $tapedKeys.dots[0], isInteractive: isInteractive)
                BrailleKey(dot: $tapedKeys.dots[1], isInteractive: isInteractive)
            }
            HStack {
                BrailleKey(dot: $tapedKeys.dots[2], isInteractive: isInteractive)
                BrailleKey(dot: $tapedKeys.dots[3], isInteractive: isInteractive)
            }
            HStack {
                BrailleKey(dot: $tapedKeys.dots[4], isInteractive: isInteractive)
                BrailleKey(dot: $tapedKeys.dots[5], isInteractive: isInteractive)
            }
        }
    }
    
    func sizeToFit(proxySize: CGSize) -> CGFloat {
        return proxySize.height / 3
    }
}
