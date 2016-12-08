//
//  Recipe.swift
//  Foodtruck
//
//  Created by Fhict on 08/12/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

import Foundation

class Recept{
    
    // Fields
    var name:String
    var calories:Int
    var cookingTime:Int
    var amountOfPersons:Int
    var products:[Product]
    
    // Constructor
    init(name: String, calories:Int, cookingTime:Int, amountOfPersons:Int){
        self.name = name
        self.calories = calories
        self.cookingTime = cookingTime
        self.amountOfPersons = amountOfPersons
        self.products = []
    }
    
    // Methods
    func addProduct(product: Product){
        products.append(product)
    }
    
    func removeProduct(productID: Int) -> Product{
        return products.remove(at: productID)
    }
}
