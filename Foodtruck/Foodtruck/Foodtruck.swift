//
//  Foodtruck.swift
//  Foodtruck
//
//  Created by Fhict on 08/12/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

import Foundation

class Foodtruck{
    
    // Fields
    var ID: Int = 0
    var name: String = ""
    var location: String = ""
    var products:[Product]
    
    // Constructor
    init(ID:Int, name:String, location:String){
        self.ID = ID
        self.name = name
        self.location = location
        self.products = []
    }
    
    // Methods
    func addProduct(product:Product){
        products.append(product)
    }
    
    func removeProduct(productID: Int) -> Product{
        return products.remove(at: productID)
    }
}
