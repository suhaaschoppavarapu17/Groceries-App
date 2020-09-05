//
//  SecondViewController.swift
//  Assignment10
//
//  Created by Suhaas Choppavarapu on 9/1/20.
//  Copyright © 2020 Suhaas Choppavarapu. All rights reserved.
//

import UIKit

public struct Groceries {
    public var titles: [String]
    public var images: [String]
    public var description: [String]
}

class SecondViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var secondTableView: UITableView!
    
    //MARK:- Properties
    var selectedProductIndex = 0
    let secondSegue = "secondSegue"
    
    var grocery: Groceries?
    var titles: [String] = []
    var productDescription: [String] = []
    var productImages: [String] = []
    
    //MARK:- View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        secondTableView.dataSource = self
        secondTableView.delegate = self
        
        secondTableView.tableFooterView = UIView()
        
        secondTableView.backgroundColor = UIColor(red: 0.55, green: 0.81, blue: 0.83, alpha: 1.00)
    }
    
    //MARK:- Segue Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            segue.identifier == secondSegue,
            let destinationVC = segue.destination as? ThirdViewController,
            let grocery = grocery
        {
            destinationVC.imageName = grocery.images[selectedProductIndex]
            destinationVC.productDescription = grocery.description[selectedProductIndex]
            destinationVC.title = grocery.titles[selectedProductIndex] + " " + "details"
        }
        
    }
}

//MARK:- UITableViewDataSource Methods
extension SecondViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let grocery = grocery else {
            return 0
        }
        return grocery.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = secondTableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifier,
                                                           for: indexPath) as? SecondTableViewCell,
            let grocery = grocery else {
                return UITableViewCell()
        }
        
        cell.nameOfItems.text = grocery.titles[indexPath.row]
        cell.descriptionLabel.text = grocery.description[indexPath.row]
        cell.image2.image = UIImage(named: grocery.images[indexPath.row])
        return cell
    }
}

//MARK:- UITableViewDelegate Methods
extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProductIndex  = indexPath.row
        performSegue(withIdentifier: secondSegue, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
