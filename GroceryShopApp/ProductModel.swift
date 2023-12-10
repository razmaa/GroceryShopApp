//
//  ProductModel.swift
//  GroceryShopApp
//
//  Created by nika razmadze on 10.12.23.
//

import Foundation
import SwiftUI

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var counter: Int
    var image: Image
    var price: Double
    
}
