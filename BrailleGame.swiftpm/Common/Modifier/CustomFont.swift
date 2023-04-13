//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/04/10.
//

import SwiftUI

struct CustomFont: ViewModifier {
    
    var fontSize: Int
    var hex: String = "#000000"
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: CGFloat(fontSize), weight: .bold, design: .default))
            .foregroundColor(Color(hex: hex)!)
    }
}

