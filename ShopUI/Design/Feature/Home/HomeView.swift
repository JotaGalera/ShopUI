//
//  HomeView.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 29/12/2020.
//
import SwiftUI

struct HomeView: View {
    var body: some View{
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Home")
                    TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "heart", tabName: "Wishlist")
                }
                .frame(width: geometry.size.width, height: geometry.size.height/8)
                .background(Color("TabBarBackground").shadow(radius: 2))
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct TabBarIcon: View {
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack{
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top,10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -4)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
