//
//  ViewRouter.swift
//  ShopUI
//
//  Created by Javier Galera Garrido on 29/12/2020.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case wishlist
}


struct MainView: View {
    @StateObject var viewRouter: ViewRouter
    @StateObject var productListVM = ProductListViewModelImplementation()
    
    var body: some View {
        Text("ya estoy aqui")
        
            
    }
    
}

struct MainView_Preview: PreviewProvider {
    static var previews: some View {
        MainView(viewRouter: ViewRouter())
    }
}
