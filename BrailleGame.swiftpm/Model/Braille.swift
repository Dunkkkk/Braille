//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/03/20.
//

import SwiftUI

struct Braille: Equatable {
    
    var dots: [Dot]
    var meaning: [String]
    
    init(meaning: [String], dotNumber: [Int]) {
        var dots = [Dot]()
        for index in 1 ... 6 {
            let shouldIndexAcitve: Bool = dotNumber.contains(where: { $0 == index })
            dots.append(Dot(id: index, status: shouldIndexAcitve ? .activate : .nonActivate))
        }
        self.dots = dots
        self.meaning = meaning
    }
}

extension Braille {
    
    static var emptyBraille = Braille(meaning: [""], dotNumber: [])
    
    static func == (lhs: Braille, rhs: Braille) -> Bool {
        return lhs.dots == rhs.dots
    }
    
    func hint(dots: [Dot]) -> (DotStatus, Int) {
        var hints: [(DotStatus, Int)] = [(DotStatus, Int)]()
        for dot in dots.enumerated() {
            if self.dots[dot.offset].status != dot.element.status {
                if dot.element.status == .activate { hints.append((.wrong, dot.offset)) }
                else if dot.element.status == .nonActivate{ hints.append((.correct, dot.offset)) }
            }
        }
        
        return hints.randomElement() ?? (.activate, 0)
    }
}

