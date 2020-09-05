//
//  SecondTableViewCell.swift
//  Assignment10
//
//  Created by Suhaas Choppavarapu on 9/2/20.
//  Copyright © 2020 Suhaas Choppavarapu. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    //MARK:- Properties
    static let identifier = "secondCell"
    
    //MARK:- IBOutlets
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var nameOfItems: UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    
}
