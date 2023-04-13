//
//  File.swift
//  
//
//  Created by changgyo seo on 2023/04/09.
//

import SwiftUI

struct PathView: View {
    
    var directions: [Direction]
    var size: Int
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            
            if directions.contains(where: { $0 == .up }) {
                path.addLine(to: CGPoint(x: size, y: 0))
            }
            else {
                path.move(to: CGPoint(x: size, y: 0))
            }
            
            if directions.contains(where: { $0 == .right }){
                path.addLine(to: CGPoint(x: size, y: size))
            }
            else {
                path.move(to: CGPoint(x: size, y: size))
            }
            
            if directions.contains(where: { $0 == .down }){
                path.addLine(to: CGPoint(x: 0, y: size))
            }
            else {
                path.move(to: CGPoint(x: 0, y: size))
            }
            
            if directions.contains(where: { $0 == .left }){
                path.addLine(to: CGPoint(x: 0, y: 0))
            }
            else {
                path.move(to: CGPoint(x: 0, y: 0))
            }
        }
        .stroke(lineWidth: 6)
        .foregroundColor(.white)
    }
}

extension PathView {
    enum Direction {
        case up
        case down
        case left
        case right
    }
}

