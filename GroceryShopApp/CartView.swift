//
//  CartView.swift
//  GroceryShopApp
//
//  Created by nika razmadze on 10.12.23.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        
        HStack {
            
            Image(systemName: "cart.fill")
                .padding()
            
            VStack{
                HStack{
                    Text("Total Quantity:")
                    
                    
                    Spacer()
                    
                    Text("\(viewModel.calculateTotalQuantity())")
                }
                
                
                HStack {
                    Text("Total Amount:")
                    
                    Spacer()
                    
                    Text("\(viewModel.total, specifier: "%.2f")$")
                }
            }
            
            Button("20% OFF"){
                viewModel.applyDiscount()
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .foregroundStyle(.black)
            
        }
    }
}

#Preview {
    CartView()
        .environmentObject(ViewModel())
}
