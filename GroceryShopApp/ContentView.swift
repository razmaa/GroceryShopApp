//
//  ContentView.swift
//  GroceryShopApp
//
//  Created by nika razmadze on 10.12.23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            
            Toggle(isOn: $isDarkMode) {
                Text(isDarkMode ? "Dark Mode" : "Light Mode")
            }
            .padding()
            
            Text("Products")
                .padding()
            
            List {
                ForEach(viewModel.availableProducts.indices) { index in
                    let product = viewModel.availableProducts[index]
                    HStack {
                        product.image
                            .resizable()
                            .frame(width: 75, height: 50)
                        
                        VStack{
                            Text(product.name)
                            
                            Text("\(product.price, specifier: "%.2f")$")
                        }
                        
                        Spacer()
                        
                        Button("-") {
                            viewModel.decreaseCount(index: index)
                        }
                        .buttonStyle(.bordered)
                        
                        Text("\(product.counter)")
                        
                        Button("+") {
                            viewModel.increaseCount(index: index)
                        }
                        .buttonStyle(.bordered)
                        
                        Button {
                            viewModel.deleteFromCart(index: index)
                        } label: {
                            Image(systemName: "xmark.bin")
                                .foregroundStyle(isDarkMode ? .white : .black)
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding()
                }
                
            }
            .listStyle(.plain)
            .background(.thinMaterial)
            
            CartView()
                .environmentObject(viewModel)
                .padding()
            
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    ContentView()
}
