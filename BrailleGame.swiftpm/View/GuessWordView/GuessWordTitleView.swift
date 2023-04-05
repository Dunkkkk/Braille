//
//  GuessWordTitleView.swift
//
//
//  Created by changgyo seo on 2023/04/04.
//

import SwiftUI

struct GuessWordTitleView: View {
    
    @Binding var words: [String]
    
    var body: some View {
        HStack {
            ForEach(words) { word in
                Text(word)
                    .font(.system(size: 48, weight: .bold, design: .rounded))
            }
        }
    }
}
