import SwiftUI

struct CollectionView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Header
                    HStack {
                        Text("Order From the Best Of **Snacks**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                        }
                        .foregroundColor(.black)
                    }
                    .padding(30)
                    
                    // Product Grid
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(productList) { item in
                            SmallProductCard(product: item)
                                .environmentObject(cartManager)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    // Small Product Card View
    struct SmallProductCard: View {
        let product: Product
        
        @EnvironmentObject var cartManager: CartManager
        
        var body: some View {
            ZStack {
                // Product Image
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(Angle(degrees: 30))
                
                // Product Details
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: 70)
                    
                    Text(product.category)
                        .font(.system(size: 10))
                        .padding(5)
                        .background(Color.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Text("$\(product.price).0")
                                                       .font(.system(size: 14, weight: .semibold))
                        
                        Spacer()
                        
                        Button {
                            cartManager.addToCart(product: product)
                            // Add to basket action
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 45, height: 40)
                                .background(Color.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.trailing, -12)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(Color.white.opacity(0.9))
                    .clipShape(Capsule())
                }
                .padding(20)
                .frame(width: 170, height: 215)
            }
            .frame(width: 170, height: 215)
            .background(product.color.opacity(0.13))
            .cornerRadius(30)
            .padding(.leading, 10)
        }
    }
    
 
}

#Preview {
    CollectionView()
        .environmentObject(CartManager())
}
