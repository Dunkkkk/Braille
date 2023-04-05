//
//  SwiftUIView.swift
//  
//
//  Created by changgyo seo on 2023/03/20.
//

import SwiftUI

struct BrailleKey: View {
    
    @State private var numberOfShakes: CGFloat = 0
    @Binding var dot: Dot
    var isInteractive: Bool = true
    
    var body: some View {
        Circle()
            .foregroundColor(dot.status.color)
            //.modifier(ShakeEffect(delta: numberOfShakes))
            .animation(.linear(duration: 0.2), value: dot.status)
            .onTapGesture {
                if isInteractive {
                    dot.status.toggle()
//                    if numberOfShakes == 0 {
//                        numberOfShakes = 110
//
//                    }else {
//                        numberOfShakes = 0
//                    }
                }
            }
    }
}
