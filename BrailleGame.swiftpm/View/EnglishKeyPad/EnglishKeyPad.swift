//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/04/06.
//

import SwiftUI

struct EnglishKeyPad: View {
    
    @State var meanings: [String]
    
    var body: some View {
        VStack{
            HStack {
                EnglishKey(meaning: meanings[0])
                EnglishKey(meaning: meanings[1])
            }
            HStack {
                EnglishKey(meaning: meanings[2])
                EnglishKey(meaning: meanings[3])
            }
            HStack {
                EnglishKey(meaning: meanings[4])
                EnglishKey(meaning: meanings[5])
            }
        }
        .frame(width: 273, height: 434)
    }
}

struct EnglishKeyPad_Previewer: PreviewProvider {
    
    static var previews: some View {
        EnglishKeyPad(meanings: ["A","B","C","D","E","F"])
    }
}
