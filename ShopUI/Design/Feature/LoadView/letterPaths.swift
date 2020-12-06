//
//  letterPaths.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 06/12/2020.
//

import SwiftUI

struct LetterU: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addArc(center: CGPoint(x: rect.size.width/4,
                                        y: rect.size.height/2),
                        radius: rect.size.width/4,
                        startAngle: .degrees(180),
                        endAngle: .degrees(0),
                        clockwise: true)
            path.addLine(to: CGPoint(x: rect.size.width/2,y: 0))
        }
    }
}

struct LetterI: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.size.width/2,
                                     y: 0))
            path.move(to: CGPoint(x: rect.size.width/2/2,
                                  y: 0))
            path.addLine(to: CGPoint(x: rect.size.width/2/2,
                                     y: rect.size.height/1.5))
            path.move(to: CGPoint(x: 0,
                                  y: rect.size.height/1.4))
            path.addLine(to: CGPoint(x: rect.size.width/2,
                                     y: rect.size.height/1.4))
        }
    }
}

struct LetterS: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.width/4, y: rect.size.height/4/2))
            path.addArc(center: CGPoint(x: rect.size.width/4/2,
                                        y: rect.size.height/4/2),
                        radius: rect.size.width/8,
                        startAngle: .degrees(0),
                        endAngle: .degrees(120),
                        clockwise: true)
            path.addLine(to: CGPoint(x: rect.width/4.5, y: rect.size.height/3))
            path.addArc(center: CGPoint(x: rect.size.width/4/2,
                                        y: rect.size.height/2.5),
                        radius: rect.size.width/8,
                        startAngle: .degrees(330),
                        endAngle: .degrees(180),
                        clockwise: false)
        }
    }
}

struct LetterH: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0,
                                  y: 0))
            path.addLine(to: CGPoint(x: 0,
                                     y: rect.size.height/2))
            path.move(to: CGPoint(x: 0,
                                  y: rect.size.height/4))
            path.addLine(to: CGPoint(x: rect.size.height/4,
                                     y: rect.size.height/4))
            path.move(to: CGPoint(x: rect.size.width/3,
                                  y: 0))
            path.addLine(to: CGPoint(x: rect.size.width/3,
                                     y: rect.size.height/2))
        }
    }
}

struct LetterO: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.size.width/2.4,
                                  y: rect.size.height/4/2))
            path.addArc(center: CGPoint(x: rect.size.width/4,
                                        y: rect.size.height/4/2),
                        radius: rect.size.width/6,
                        startAngle: .degrees(0),
                        endAngle: .degrees(180),
                        clockwise: true)
            path.move(to: CGPoint(x: rect.size.width/12.5,
                                  y: rect.size.height/6))
            path.addLine(to: CGPoint(x: rect.size.width/12.5,
                                     y: rect.size.height/2.3))
            path.addArc(center: CGPoint(x: rect.size.width/4,
                                        y: rect.size.height/2.5),
                        radius: rect.size.width/6,
                        startAngle: .degrees(180),
                        endAngle: .degrees(0),
                        clockwise: true)
            path.move(to: CGPoint(x: rect.size.width/2.4, y: rect.size.height/2.5))
            path.addLine(to: CGPoint(x: rect.size.width/2.4, y: rect.size.height/4/2))
        }
    }
}

struct LetterP: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0,
                                  y: 0))
            path.addLine(to: CGPoint(x: 0,
                                     y: rect.size.height/2))
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.size.width/6,
                                     y: 0))
            path.move(to: CGPoint(x: 0,
                                  y: rect.size.height/4))
            path.addLine(to: CGPoint(x: rect.size.width/6,
                                     y: rect.size.height/4))
            path.addArc(center: CGPoint(x: rect.size.width/6,
                                        y: rect.size.height/4/2),
                        radius: rect.size.width/8,
                        startAngle: .degrees(90),
                        endAngle: .degrees(270),
                        clockwise: true)
            
        }
    }
}
