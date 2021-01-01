//
//  ActivityIndicator.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 29/12/2020.
//

import SwiftUI

struct ActivityIndicator: View {
    @State var animate = false
    
    let style = StrokeStyle(lineWidth: 6, lineCap: .round)
    let color1 = Color.black
    let color2 = Color.gray.opacity(0.0)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(.white)
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Circle()
                .trim(from: 0.1, to: 0.8)
                .stroke(
                    AngularGradient(gradient: .init(colors: [color2,color1]), center: .center ), style: style)
                .rotationEffect(Angle(degrees: animate ? 360 : 0))
                .animation(
                    Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: false)
                )
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        
        .shadow(radius: 15)
        .onAppear() {
            self.animate.toggle()
        }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
