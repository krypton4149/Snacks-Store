
import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    
    @Environment(\.presentationMode) var mode
    
    // Sample Cart Item Count (replace with actual data)
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Cart")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Text("\(cartManager.products.count)")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .background(.yellow.opacity(0.5))
                                .clipShape(Capsule())
                        }
                        .foregroundColor(.black)
                        
                        Button{
                            mode.wrappedValue.dismiss()
                            
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                        }
                        .foregroundStyle(.black)
                    }
                    .padding(30)
                    
                    
                    // Cart Products
                    VStack(spacing:20){
                        ForEach(cartManager.products, id: \.name){ item in
                            CartProductCard(product: item)
                        }
                    }
                    
                    .padding(.horizontal)
                    
                    
                    // Card Total
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("Delivery Amount")
                            Spacer()
                            Text("Free")
                                .font(.system(size: 24, weight: .semibold))
                        }
                        
                        Divider()
                        
                        Text("Total Amount")
                            .font(.system(size: 24, weight: .semibold))
                        
                        Text("USD \(cartManager.total)")
                            .font(.system(size: 36, weight: .semibold))
                        
                        
                        
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(.yellow.opacity(0.5))
                    .clipShape(.rect(cornerRadius: 30))
                    .padding()
                    
                    
                    //Buttons
                    
                    Button{
                        
                    }label: {
                        Text("Make Payment")
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(.yellow.opacity(0.5))
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.black)
                            .clipShape(Capsule())
                            .padding()
                    }
                    
                    
                    // Total Amount
                    
                    // Button To Make Payment
                    
                    // Placeholder for Cart Items List
                    
                }
            }
           
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}


// Cart Product View

struct CartProductCard: View{
     
    var product: Product
    
    var body: some View{
        HStack(alignment: .center,spacing: 20) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 80, height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(Circle())
            
            VStack(alignment: .leading, content:{
                Text("\(product.name)")
                    .font(.headline)
                
                Text(product.category)
                    .font(.callout)
                    .opacity(0.5)
                
            })
            
            Spacer()
            
            Text("$\(product.price)")
                .padding()
                .background(.yellow.opacity(0.5))
                .clipShape(Capsule())
                   }
        }
    }

