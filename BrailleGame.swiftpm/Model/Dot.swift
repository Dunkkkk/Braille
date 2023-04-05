//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/03/20.
//

struct Dot: Identifiable, Equatable {
    
    var id: Int
    var status: DotStatus = .nonActivate
    
    
    
    static let dots: [Dot] = [Dot(id: 1),
                              Dot(id: 2),
                              Dot(id: 3),
                              Dot(id: 4),
                              Dot(id: 5),
                              Dot(id: 6)]
}



