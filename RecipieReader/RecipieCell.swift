//
//  RecipieCell.swift
//  RecipieReader
//
//  Created by Anna Nguyen on 9/28/17.
//  Copyright © 2017 Anna Nguyen. All rights reserved.
//

import UIKit

class RecipieCell: UITableViewCell {
    
    var recipie: Recipe? {
        didSet(newValue) {
            self.recipieNameLabel.text = self.recipie?.name
        }
    }
    
    @IBOutlet weak var recipieNameLabel: UILabel!
    
}
