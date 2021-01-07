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

