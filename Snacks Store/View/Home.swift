import SwiftUI

struct Home: View {
    
    // Selected Category Property
    @State private var selectedCategory = "Choco"
    
    @EnvironmentObject var cartManager: CartManager
    
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
                        
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    }
                    .padding(30)
                    
                    // Category List
                    CategoryListView
                    
                    // Collection View
                    HStack {
                        Text("Choco **Collections**")
                            .font(.system(size: 24))
                        
                        Spacer()
                        
                        NavigationLink{
                            CollectionView()
                                .environmentObject(cartManager)
                        } label:{
                            
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                            
                        }
                        .foregroundColor(.black)
                       
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    // Product List
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(productList, id: \.id) { item in
                                ProductCard(product: item)
                                    .environmentObject(cartManager)
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Category List View
    var CategoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(CategoryList, id: \.id) { item in
                        Button(action: {
                            selectedCategory = item.title
                        }) {
                            HStack(spacing: 10) {
                                if item.title != "All" {
                                    Image(item.icon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(selectedCategory == item.title ? .yellow : .gray)
                                }
                                
                                Text(item.title)
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(selectedCategory == item.title ? .white : .black)
                            }
                            .frame(width: 100, height: 50)
                            .padding(.horizontal, 10)
                            .background(selectedCategory == item.title ? Color.gray : Color.gray.opacity(0.1))
                            .cornerRadius(20)
                            .shadow(radius: 3)
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

struct ProductCard: View {
    
    var product: Product
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            // Set the image size to match the card size and scale accordingly
            Image(product.image)
                .resizable()
                .scaledToFill() // Use scaledToFill to ensure the image fills the entire area
                .frame(width: 290, height: 380) // Match the frame size of the card
                .clipShape(RoundedRectangle(cornerRadius: 57)) // Clip the image to the card's corner radius
                .overlay(RoundedRectangle(cornerRadius: 57).stroke(Color.white.opacity(0.5), lineWidth: 1))
            
            VStack(alignment: .leading, content: {
                Text("\(product.name)")
                    .font(.system(size: 36, weight: .semibold))
                    .frame(width: 140)
                
                Text(product.category)
                    .font(.callout)
                    .padding()
                    .background(.white.opacity(0.5))
                    .clipShape(Capsule())
                
                Spacer()
                
                HStack {
                    Text("$\(product.price).0")
                        .font(.system(size: 24, weight: .semibold))
                    
                    Spacer()
                    
                    Button {
                        cartManager.addToCart(product: product)
                    } label: {
                        Image(systemName: "basket")
                            .imageScale(.large)
                            .frame(width: 90, height: 68)
                            .background(Color.black)
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, -10)
                    
                }
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(.white.opacity(0.9))
                .clipShape(Capsule())
            })
            .padding(30)
            .frame(width: 336, height: 422)
        }
        .background(product.color.opacity(0.13))
        .clipShape(RoundedRectangle(cornerRadius: 57))
        .padding(.leading, 20)
    }
}


#Preview {
    Home()
        .environmentObject(CartManager())
}
