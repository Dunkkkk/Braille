//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/03/23.
//

extension Array where Element == Dot {
    static func ==(lhs: Array, rhs: Array) -> Bool {
        var isSame = true
        for origin in lhs.enumerated() {
            if origin.element.status != rhs[origin.offset].status { isSame = false }
        }
        
        return isSame
    }
}

extension Array where Element == String {
    
    func isThere(a target: String) -> Bool  {
        for string in self {
            if string == target { return true }
        }
        return false
    }
}
