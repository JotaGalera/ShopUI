//
//  WishlistButton.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 01/01/2021.
//

import SwiftUI

struct WishlistButton: View {
    @EnvironmentObject var productDetailsVM: ProductDetailsViewModelImplementation
    @State var isProductAddedToWishlist: Bool = false
        
    var body: some View {
        Button(action: {
            if !isProductAddedToWishlist {
                productDetailsVM.addToWishlist()
            } else {
                productDetailsVM.removeToWishlist()
            }
            isProductAddedToWishlist.toggle()
        }, label: {
            HStack{
                ZStack {
                    HeartFilledEffect()
                        .opacity(isProductAddedToWishlist ? 0 : 1)
                        .scaleEffect( isProductAddedToWishlist ? 1.0 : 0.0000001)
                        .animation(Animation.easeInOut(duration: 0.8))
                        
                    HeartFilledEffect()
                        .opacity(1)
                        .scaleEffect( isProductAddedToWishlist ? 0.5 : 0.0000001)
                        .animation(Animation.easeInOut(duration: 0.8))
                        
                    HeartPath()
                        .scale(0.5)
                        .stroke(style: StrokeStyle(lineWidth: 3.0))
                }
            }
        })
        .onAppear() {
            isProductAddedToWishlist = productDetailsVM.isProductAddedToWishlist()
        }
    }
}

struct HeartAnimation: View {
    @State var isWishlistAdded: Bool = false
    
    var body: some View {
        HStack{
            ZStack {
                HeartFilledEffect()
                    .opacity(isWishlistAdded ? 0 : 1)
                    .scaleEffect( isWishlistAdded ? 1.0 : 0.0000001)
                    .animation(Animation.easeInOut(duration: 0.8))
                    
                HeartFilledEffect()
                    .opacity(1)
                    .scaleEffect( isWishlistAdded ? 0.5 : 0.0000001)
                    .animation(Animation.easeInOut(duration: 0.8))
                    
                HeartPath()
                    .scale(0.5)
                    .stroke(style: StrokeStyle(lineWidth: 3.0))
            }
        }
        .onTapGesture {
            isWishlistAdded.toggle()
        }
    }
    
    public func animationOn() {
        isWishlistAdded.toggle()
    }
}

struct HeartPath: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 50, y: 25))
            path.addCurve(to: CGPoint(x: 50, y: 60), control1: CGPoint(x: 60, y: 10), control2: CGPoint(x: 90, y: 25))
            path.addCurve(to: CGPoint(x: 50, y: 25), control1: CGPoint(x: 10, y: 25), control2: CGPoint(x: 40, y: 10))
            path.closeSubpath()
        }
    }
}

struct HeartFilledEffect: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 50, y: 25))
            path.addCurve(to: CGPoint(x: 50, y: 60), control1: CGPoint(x: 60, y: 10), control2: CGPoint(x: 90, y: 25))
            path.addCurve(to: CGPoint(x: 50, y: 25), control1: CGPoint(x: 10, y: 25), control2: CGPoint(x: 40, y: 10))
            path.closeSubpath()
        }
        .fill(Color("WishlistButton"))
    }
}

struct WishlistButton_Previews: PreviewProvider {
    static var previews: some View {
        HeartAnimation()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
