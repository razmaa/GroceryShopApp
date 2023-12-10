//
//  Content-ViewModel.swift
//  GroceryShopApp
//
//  Created by nika razmadze on 10.12.23.
//

import Foundation
import SwiftUI


@MainActor class ViewModel: ObservableObject {
    
    @Published var availableProducts: [Product] = [
        Product(name: "Abiu", counter: 0, image: Image("abiu"), price: 3.1),
        Product(name: "Acai", counter: 0, image: Image("acai"), price: 2.3),
        Product(name: "Acerola", counter: 0, image: Image("acerola"), price: 1.8),
        Product(name: "Ackee", counter: 0, image: Image("ackee"), price: 4.8),
        Product(name: "Banana", counter: 0, image: Image("banana"), price: 1.7),
        Product(name: "Bilimbi", counter: 0, image: Image("bilimbi"), price: 18.3),
        Product(name: "Breadfruit", counter: 0, image: Image("breadfruit"), price: 2.3),
        Product(name: "Apple", counter: 0, image: Image(systemName: "apple.logo"), price: 2.3),
        Product(name: "Apple", counter: 0, image: Image(systemName: "apple.logo"), price: 2.3),
        Product(name: "Apple", counter: 0, image: Image(systemName: "apple.logo"), price: 2.3),
    ]
    @Published var selectedProducts  = [Product]()
    @Published var total: Double = 0
    @Published var isDiscountApplied: Bool = false
    
    func increaseCount(index: Int) {
        availableProducts[index].counter += 1
        updateSelectedProducts()
    }
    
    func decreaseCount(index: Int) {
        if availableProducts[index].counter > 0 {
            availableProducts[index].counter -= 1
            updateSelectedProducts()
        }
        
    }
    
    func updateSelectedProducts() {
        selectedProducts = availableProducts.filter { $0.counter > 0 }
        total = selectedProducts.reduce(0) { $0 + $1.price * Double($1.counter) }
    }
    
    func deleteFromCart(index: Int) {
        availableProducts[index].counter = 0
        updateSelectedProducts()
    }
    
    func calculateTotalQuantity() -> Int {
        selectedProducts.reduce(0) { $0 + $1.counter }
    }
    
    func applyDiscount() {
        guard !isDiscountApplied else { return }
        
        for index in availableProducts.indices {
            availableProducts[index].price *= 0.8
        }
        total *= 0.8
        isDiscountApplied = true
    }
    
}

