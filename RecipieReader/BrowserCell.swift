//
//  BrowserCell.swift
//  RecipieReader
//
//  Created by Anna Nguyen on 10/10/17.
//  Copyright © 2017 Anna Nguyen. All rights reserved.
//

import UIKit

class BrowserCell: UICollectionViewCell {
    
    var recipie: Recipe? {
        didSet(oldValue) {
            guard let newRecipie = self.recipie else {return}
            nameLabel.text = newRecipie.name
            stepsLabel.text = "\(String(describing: self.recipie?.steps.count)) steps"
            ImageService.shared.imageForURL(url: recipie?.imageURL){ (image, url) in
                if url == self.recipie?.imageURL {
                    self.imageView.image = image
                }
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    //    func configure(recipie: Recipe) {
    //        self.recipie = recipie
    //        nameLabel.text = recipie.name
    //        stepsLabel.text = "recipie.steps.count"
    //        ImageService.shared.imageForURL(url: recipie.imageURL){ (image, url) in
    //            if url == self.recipie?.imageURL {
    //                self.imageView.image = image
    //            }
    //        }
    //    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var stepsLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
}

