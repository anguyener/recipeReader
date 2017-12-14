//
//  IngredientCell.swift
//  RecipieReader
//
//  Created by Anna Nguyen on 10/3/17.
//  Copyright © 2017 Anna Nguyen. All rights reserved.
//

import UIKit

class IngredientCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    func configure(_ with: Ingredient?) {
        nameLabel.text = with?.name
        quantityLabel.text = with?.quantity
    }
}
