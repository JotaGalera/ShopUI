import SwiftUI

struct ContentView : View {
    var body: some View {
        UIShopAnimation().padding(20)
    }
}

struct UIShopAnimation: View {
    @State private var percentage: CGFloat = .zero
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Title(percentage: $percentage)
            Subtitle(percentage: $percentage)
        }
    }
}

struct Title: View {
    @Binding var percentage: CGFloat
    
    var body: some View {
        ZStack {
            LetterU()
                .trim(from: 0, to: percentage)
                .stroke(Color.white,
                        style: StrokeStyle(lineWidth: 12,
                                           lineCap: .round,
                                           lineJoin: .round))
                .frame(width: 100, height: 100)
            LetterI()
                .trim(from: 0, to: percentage)
                .stroke(Color.white,
                        style: StrokeStyle(lineWidth: 12,
                                           lineCap: .round,
                                           lineJoin: .round))
                .frame(width: 100, height: 100)
                .offset(x: 50)
        }
        .animation(.easeOut(duration: 2.0))
        .onAppear {
            percentage = 1.0
        }
    }
}

struct Subtitle: View {
    @Binding var percentage: CGFloat
    
    var body: some View {
        ZStack {
            LetterS()
                .trim(from: 0, to: percentage)
                .stroke(Color.white,
                        style: StrokeStyle(lineWidth: 6,
                                           lineCap: .round,
                                           lineJoin: .round))
                .frame(width: 50, height: 50)
                .offset(x: -25, y: 75)
              LetterH()
                .trim(from: 0, to: percentage)
                .stroke(Color.white,
                        style: StrokeStyle(lineWidth: 6,
                                           lineCap: .round,
                                           lineJoin: .round))
                .frame(width: 50, height: 50)
                .offset(x: 4, y: 75)
            LetterO()
                .trim(from: 0, to: percentage)
                .stroke(Color.white,
                        style: StrokeStyle(lineWidth: 6,
                                           lineCap: .round,
                                           lineJoin: .round))
                .frame(width: 50, height: 50)
                .offset(x: 34, y: 75)
            LetterP()
                .trim(from: 0, to: percentage)
                .stroke(Color.white,
                        style: StrokeStyle(lineWidth: 6,
                                           lineCap: .round,
                                           lineJoin: .round))
                .frame(width: 50, height: 50)
                .offset(x: 65, y: 75)
        }
        .animation(.easeOut(duration: 2.0))
        .onAppear {
            percentage = 1.0
        }
    }
}
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
            path.move(to: CGPoint(x: rect.size.width/4,
                                  y: 0))
            path.addLine(to: CGPoint(x: rect.size.height/4,
                                     y: rect.size.height/2))
        }
    }
}

struct LetterO: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.size.height/4,
                                  y: rect.size.height/4/2))
            path.addArc(center: CGPoint(x: rect.size.width/4/2,
                                        y: rect.size.height/4/2),
                        radius: rect.size.width/8,
                        startAngle: .degrees(0),
                        endAngle: .degrees(180),
                        clockwise: true)
            path.move(to: CGPoint(x: 0,
                                  y: rect.size.height/6))
            path.addLine(to: CGPoint(x: 0,
                                     y: rect.size.height/2.3))
            path.addArc(center: CGPoint(x: rect.size.width/4/2,
                                        y: rect.size.height/2.5),
                        radius: rect.size.width/8,
                        startAngle: .degrees(180),
                        endAngle: .degrees(0),
                        clockwise: true)
            path.move(to: CGPoint(x: rect.size.width/4, y: rect.size.height/2.5))
            path.addLine(to: CGPoint(x: rect.size.width/4, y: rect.size.height/4/2))
        }
    }
}

struct LetterO2: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.size.height/4,
                                  y: rect.size.height/4/2))
            path.addArc(center: CGPoint(x: rect.size.width/4/2,
                                        y: rect.size.height/4/2),
                        radius: rect.size.width/8,
                        startAngle: .degrees(0),
                        endAngle: .degrees(90),
                        clockwise: true)
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
