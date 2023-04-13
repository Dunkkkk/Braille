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
            .frame(width: 127, height: 127)
            .foregroundColor(dot.status.color)
            .shadow(color: dot.status.shadowColor, radius: 20, x: 0, y: 0)
            .animation(.linear(duration: 0.2), value: dot.status)
            .onTapGesture {
                if isInteractive {
                    dot.status.toggle()
                }
            }
    }
}
