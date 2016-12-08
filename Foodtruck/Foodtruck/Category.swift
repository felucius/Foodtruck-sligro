//
//  Category.swift
//  Foodtruck
//
//  Created by Fhict on 08/12/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

import Foundation

class Category{
    
    // Fields
    var name:String
    var season:String
    var isFestival:Bool
    var products:[Product]
    
    // Constructor
    init(name:String, season:String, isFestival:Bool){
        self.name = name
        self.season = season
        self.isFestival = isFestival
        self.products = []
    }
    
    // Methods
    func addProduct(product: Product){
        products.append(product);
    }
    
    func removeProduct(productID: Int) -> Product{
        return products.remove(at: productID)
    }
}
