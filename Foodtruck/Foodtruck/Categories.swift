//
//  CategoryTableView.swift
//  Foodtruck
//
//  Created by Fhict on 09/12/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

import UIKit

class Categories: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewSoorten: UITableView!
    
    var categories = [Category]()
    
    var images = [UIImage(named: ""), UIImage(named: "")];
    var index = ["NoIndex1", "NoIndex2"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadJsonData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = tableView.dequeueReusableCell(withIdentifier: "categories", for: indexPath) as! CategoryCell
        
        let currentRow = (indexPath as NSIndexPath).row
        let currentCategory = self.categories[currentRow]
        
        category.imgCategory.image = images[indexPath.row];
        /*
         do{
         try soort.soortenImage.image = UIImage(data: NSData(contentsOf: NSURL(string:currentCat.imageKat) as! URL) as Data)
         }catch{
         print(error)
         }
         */
        
        category.lblID.text = currentCategory.ID
        category.lblName.text = currentCategory.name
        category.lblDescription.text = currentCategory.description
        
        return category;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexName = index[indexPath.row];
        let viewController = storyboard?.instantiateViewController(withIdentifier: indexName);
        self.navigationController?.pushViewController(viewController!, animated: true);
        print("Index found: " + index[indexPath.row]);
    }
    
    
    // Add method to load JSON data
    func loadJsonData(){
        let url = URL(string:"http://fijnproevers.herokuapp.com/categories.json")//"https://api.myjson.com/bins/18oe6")//"https://api.myjson.com/bins/mutm");
        let request = URLRequest(url: url!);
        let session = URLSession.shared;
        let dataTask = session.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            do{
                if let jsonObject: Any = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments){
                    self.parseJsonData(jsonObject);
                    
                }
            }
            catch{
                print("Error parsing JSON data");
            }
        })
        dataTask.resume();
    }
    
    // add method to parse the JSON data
    func parseJsonData(_ jsonObject: Any){
        if let jsonData = jsonObject as? NSArray{
            for item in jsonData{
                let newCategory = Category(
                    ID: (item as AnyObject).object(forKey: "id") as! String,
                    name: (item as AnyObject).object(forKey: "title") as! String,
                    description: (item as AnyObject).object(forKey: "description") as! String)
                    //products: (item as AnyObject).object(forKey: "imageKat") as! String)
                categories.append(newCategory);
                print("INFORMATIE PER CATEGORY")
            }
        }
        // Update wordt uitgevoerd op de main thread van de applicatie. Hierdoor wordt die snel geupdate
        DispatchQueue.main.async {
            self.tableViewSoorten.reloadData()
        }
    }
}
