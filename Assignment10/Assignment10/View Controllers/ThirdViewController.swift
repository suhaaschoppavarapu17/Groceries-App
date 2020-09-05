//
//  ThirdViewController.swift
//  Assignment10
//
//  Created by Suhaas Choppavarapu on 9/1/20.
//  Copyright © 2020 Suhaas Choppavarapu. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var imageView: UIImageView!    
    @IBOutlet weak var finalLabel: UILabel!
    
    //MARK:- Properties
    var imageName: String?
    var productDescription: String?
    
    
    //MARK:- View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageName = imageName {
            imageView.image = UIImage(named: imageName)
        }
        
        finalLabel.text = productDescription
        
        view.backgroundColor = UIColor(red: 0.55, green: 0.81, blue: 0.83, alpha: 1.00)
    }
}
