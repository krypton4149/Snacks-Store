//
//  ContentView.swift
//  Snacks App
//
//  Created by Webnotics on 12/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                Home()
                    .environmentObject(cartManager)
                
                VStack {
                    Spacer()  // Pushes the cart display to the bottom
                    
                    if cartManager.products.count > 0 {
                        NavigationLink(destination:CartView().environmentObject(cartManager)) {
                            HStack(spacing: 20) {
                                
                                Text("\(cartManager.products.count)")
                                    .padding()
                                    .background(Color.yellow)
                                    .clipShape(Circle())
                                    .foregroundColor(.black)
                                
                                VStack(alignment: .leading) {
                                    Text("Cart")
                                        .font(.system(size: 26, weight: .semibold))
                                    Text("\(cartManager.products.count) Item\(cartManager.products.count > 1 ? "s" : "")")
                                        .font(.system(size: 18))
                                }
                                
                                Spacer()
                                
                                // Display up to 3 product images in the cart preview
                                ForEach(cartManager.products.prefix(3), id: \.name) { product in
                                    Image(product.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .padding(.leading, -20)  // Adjusts spacing between images
                                }
                            }
                            .padding(20)
                            .frame(maxWidth: .infinity, maxHeight: 100)
                            .background(Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        }
                        .padding(.bottom, 30)  // Adds bottom padding
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    ContentView()
}
