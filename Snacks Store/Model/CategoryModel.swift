//
//  CategoryModel.swift
//  Snacks App
//
//  Created by Webnotics on 12/10/24.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable{
    var id: UUID = .init()
    var icon: String
    var title: String
    
}

var CategoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "choco", title: "Choco"),
    CategoryModel(icon: "wafle", title: "Waffles"),
    CategoryModel(icon: "toffee", title: "Toffee"),
]
