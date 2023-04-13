//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/04/06.
//

import SwiftUI

struct EnglishKey: View {
    
    var meaning: String
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.cyan)
                
                RoundedRectangle(cornerRadius: 15)
                    .scale(0.98)
                    .foregroundColor(.white)
                
                Text(meaning)
                    .font(.system(size: proxy.size.width / 2, weight: .bold, design: .rounded))
            }
        }
    }
}

struct Englishkey_preview: PreviewProvider {
    
    //@State var temp = ""
    static var previews: some View {
        EnglishKey(meaning: "A")
    }
}
