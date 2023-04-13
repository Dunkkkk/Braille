//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/04/09.
//


enum KeyPadMode {
    case braille
    case alphabet

    static var current: KeyPadMode = .braille
    
    mutating func toggle() {
        if self == .braille {
            self = .alphabet
        }
        else {
            self = .braille
        }
    }
}

enum GameMode {
    case word
    case alphbet
}
