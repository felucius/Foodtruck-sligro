//
//  Product.swift
//  Foodtruck
//
//  Created by Fhict on 08/12/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

import Foundation

class Product{
    
    // Fields
    var name: String
    var calories:Int
    var price:Int
    
    // Constructor
    init(name:String, calories:Int, price:Int){
        self.name = name
        self.calories = calories
        self.price = price
    }
}
