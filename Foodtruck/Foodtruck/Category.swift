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
    var ID:String
    var name:String
    var description:String
    //var season:String
    //var isFestival:Bool
    //var products:[Product]
    
    // Constructor
    init(ID:String, name:String, description:String){//season:String, isFestival:Bool){
        self.ID = ID
        self.name = name
        self.description = description
        //self.season = season
        //self.isFestival = isFestival
        //self.products = []
    }
    
    // Methods
    func addProduct(product: Product){
        //products.append(product);
    }
    
    //func removeProduct(productID: Int) -> Product{
        //return products.remove(at: productID)
    //    return null
    //}
}
