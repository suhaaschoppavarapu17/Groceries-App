//
//  ViewController.swift
//  Assignment10
//
//  Created by Suhaas Choppavarapu on 9/1/20.
//  Copyright © 2020 Suhaas Choppavarapu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Properties
    var products = ["Spices", "Dairy", "Snacks", "Drinks"]
    var indexValue: Int = 0
    
    //MARK:- View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Groceries"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor(red: 0.55, green: 0.81, blue: 0.83, alpha: 1.00)
    }
    
    //MARK:- Helper Methods
    func getProductInfo(index: Int) -> Groceries {
        switch index {
        case 0:
            let titles = ["Ginger", "Turmeric", "Cumin", "Poppy Seed", "Black Pepper", "Garlic"]
            let productDescription = ["Used as a spice and folk medicine",
                                      "Curcuma longa of Ginger Family",
                                      "Used in Cuisines in ground form",
                                      "Oilseed obtained from opium poppy",
                                      "Used as spice and seasoning",
                                      "Species in the onion genus, Allium"]
            let productImages = ["ginger", "turmeric", "cumin", "poppy seed", "black pepper", "garlic"]
            return Groceries(titles: titles.reversed(),
                             images: productImages,
                             description: productDescription)
        case 1:
            let titles = ["Milk", "Yogurt", "Ghee", "Cheese","Butter", "Cream"]
            let productDescription = ["Nutrient-rich liquid food",
                                      "Bacterial fermentation of milk",
                                      "Class of clarified butter",
                                      "Comprises protiens from milk",
                                      "Fat and protein components of milk",
                                      "Higher-fat layer skimmed from milk"]
            let productImages = ["milk", "yogurt", "ghee", "cheese","butter", "cream"]
            return Groceries(titles: titles.sorted(),
                             images: productImages,
                             description: productDescription)
        case 2:
            let titles = ["Cheetos", "Nachos", "French Fries", "Popcorn","Pringles", "Tostitos"]
            let productDescription = ["Made by Frito-Lay",
                                      "Mexican dish",
                                      "Deep Fried potatoes",
                                      "Variety of corn kernel",
                                      "Stackable potato based chips",
                                      "Made by Frito-Lay"]
            let productImages = ["cheetos", "nachos", "french fries", "popcorn","pringles", "tostitos"]
            return Groceries(titles: titles.sorted(by: >),
                             images: productImages,
                             description: productDescription)
        default:
            let titles = ["Coke", "Whiskey", "Beer", "Vodka", "Club Soda", "Red Bull"]
            let productDescription = ["Carbonated soft drink",
                                      "Distilled alcoholic beverage",
                                      "Brewed from cereal grains",
                                      "Distilled alcoholic beverage",
                                      "Water containing carbondioxide",
                                      "Energy drink"]
            let productImages = ["coke", "whiskey", "beer", "vodka", "club soda", "red bull" ]
            return Groceries(titles: titles.map{$0.lowercased()},
                             images: productImages,
                             description: productDescription)
        }
    }
    
    //MARK:- Segue Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SecondViewController {
            destination.title = products[indexValue]
            
            switch indexValue {
            case 0:
                destination.grocery = getProductInfo(index: indexValue)
                print("Fruits Category info: \(getProductInfo(index: indexValue))")
            case 1:
                destination.grocery = getProductInfo(index: indexValue)
                print(getProductInfo(index: indexValue))
            case 2:
                destination.grocery = getProductInfo(index: indexValue)
                print(getProductInfo(index: indexValue))
            default:
                destination.grocery = getProductInfo(index: indexValue)
                print(getProductInfo(index: indexValue))
            }
        }
    }
}

//MARK:- UITableViewDataSource Methods
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier) as? FirstTableViewCell {
            cell.nameOfItem.text = products[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

//MARK:- UITableViewDelegate Methods
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexValue  = indexPath.row
        performSegue(withIdentifier: "firstSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
