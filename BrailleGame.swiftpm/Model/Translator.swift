////
////  Translator.swift
////  
////
////  Created by changgyo seo on 2023/04/03.
////
//
//import Foundation
//
//struct Translator {
//    
//    static var shared: Translator = Translator()
//    
//    func translate(to origin : String) -> [Braille] {
//        
//        var brailles: [Braille] = [Braille]()
//        
//        for char in origin {
//            let target = "\(char)"
//            var meaingDictionary = BrailleDictionary.allCases.map({ $0.braille.meaning })
//            let answer = meaingDictionary.filter { meaing in
//                guard let meaning = meaing else { return false }
//                return meaning.isThere(a: target)
//            }
//        }
//    }
//    
//    
//    private init(){
//        
//    }
//}
