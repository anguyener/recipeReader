//
//  StepCell.swift
//  RecipieReader
//
//  Created by Anna Nguyen on 10/3/17.
//  Copyright © 2017 Anna Nguyen. All rights reserved.
//

import UIKit

class StepCell: UITableViewCell {
    
    @IBOutlet weak var checkbox: UIButton!
    
    @IBOutlet weak var instructionText: UILabel!
    
    @IBOutlet weak var timerText: UILabel!
    
    fileprivate func setUpCheckbox() {
        checkbox.layer.borderColor = UIColor.darkGray.cgColor
        checkbox.layer.borderWidth = 2
        checkbox.layer.backgroundColor = UIColor.white.cgColor
        checkbox.layer.cornerRadius = 3.0
    }
    
    func configure(insturctions: String?, time: Int?) {
        
        instructionText.text = insturctions
        timerText.text = String(time ?? 0)
        if time == 0 {
            timerText.isHidden = true
        }
        
        setUpCheckbox()
        
        
    }
    
    @IBAction func checkboxTapped(_ sender: Any) {
        
        checkbox.isSelected = !checkbox.isSelected
        if checkbox.isSelected {
            checkbox.layer.backgroundColor = UIColor.lightGray.cgColor
        }
        else {
            checkbox.layer.backgroundColor = UIColor.white.cgColor
        }
    }
}
