//
//  ProductModel.swift
//  Snacks Store
//
//  Created by Webnotics on 14/10/24.
//

import SwiftUI

//Product Model

struct Product: Identifiable{
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Int
}

// Sample Products

var productList = [
    Product(name: "Choco Bar", category: "Choco", image: "choco_bar", color: .green, price: 45),
    Product(name: "Panipuri", category: "Snacks", image: "Panipuri", color: .black, price: 34),
    Product(name: "Samosa", category: "Snacks", image: "Samosa", color: .orange, price: 24),
    Product(name: "Cookies", category: "Choco", image: "choco_waffles", color: .red, price: 20),
    Product(name: "Honey Waffles", category: "Waffles", image: "honey_waffles", color: .purple, price: 45),
    Product(name: "Taste Of Indian", category: "Veg Food", image: "Kitchen_Food", color: .brown, price: 20),
    Product(name: "Pizza", category: "Junk", image: "Pizza", color: .red, price: 20),
    Product(name: "Taro Donut", category: "Choco", image: "toffee_bites", color: .blue, price: 45),
]
