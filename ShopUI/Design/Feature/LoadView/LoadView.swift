import SwiftUI

struct LoadView : View {
    var body: some View {
        UIShopAnimation().padding(20)
    }
}

struct UIShopAnimation: View {
    @State private var titlePercentage: CGFloat = .zero
    @State private var subtitlePercentage: CGFloat = .zero
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    VStack{
                        Title(titlePercentage: $titlePercentage, color: .white)
                            .offset(y:20)
                        Subtitle(subtitlePercentage: $subtitlePercentage, subtitleColor: .white)
                            .offset(y:10)
                    }
                }
                NavigationLink(
                    destination: ProductListView(),
                    label: {
                        Text("Start!")
                    })
                    
            }
        }
    }
}

struct Title: View {
    @Binding var titlePercentage: CGFloat
    var color: Color
    
    var body: some View {
        HStack {
            LetterU()
                .trim(from: 0, to: titlePercentage)
                .stroke(color,
                        style: StrokeStyle(lineWidth: 12,
                                           lineCap: .round,
                                           lineJoin: .round))
                .offset(x: 50)
            LetterI()
                .trim(from: 0, to: titlePercentage)
                .stroke(color,
                        style: StrokeStyle(lineWidth: 12,
                                           lineCap: .round,
                                           lineJoin: .round))
                
        }
        .frame(width: 200, height: 100)
        .onAppear(perform: {
            DispatchQueue.main.async {
                withAnimation(Animation.easeOut(duration: 2.0)){
                    titlePercentage = 1.0
                }
            }
        })
    }
}

struct Subtitle: View {
    @Binding var subtitlePercentage: CGFloat
    var subtitleColor: Color
    
    var body: some View {
        HStack {
            LetterS()
                .trim(from: 0, to: subtitlePercentage)
                .stroke(subtitleColor,
                        style: StrokeStyle(lineWidth: 6,
                                           lineCap: .round,
                                           lineJoin: .round))
                .offset(x: 50)
              LetterH()
                .trim(from: 0, to: subtitlePercentage)
                .stroke(subtitleColor,
                        style: StrokeStyle(lineWidth: 6,
                                           lineCap: .round,
                                           lineJoin: .round))
                .offset(x: 25, y: 0)
            LetterO()
                .trim(from: 0, to: subtitlePercentage)
                .stroke(subtitleColor,
                        style: StrokeStyle(lineWidth: 6,
                                           lineCap: .round,
                                           lineJoin: .round))
                .offset(x: 2, y: 0)
            LetterP()
                .trim(from: 0, to: subtitlePercentage)
                .stroke(subtitleColor,
                        style: StrokeStyle(lineWidth: 6,
                                           lineCap: .round,
                                           lineJoin: .round))
                .offset(x: -15)
        }
        .frame(width: 200, height: 50, alignment: .center)
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                withAnimation(Animation.easeOut(duration: 2.0)){
                    subtitlePercentage = 1.0
                }
            })
        })
        
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
