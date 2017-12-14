//
//  RecipieViewController.swift
//  RecipieReader
//
//  Created by Anna Nguyen on 10/3/17.
//  Copyright © 2017 Anna Nguyen. All rights reserved.
//

import UIKit

class RecipieViewController: UIViewController {
    
    var recipie: Recipe?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var recipieName: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
  /*  @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    } */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        recipieName.text = recipie?.name
        ImageService.shared.imageForURL(url: recipie?.imageURL) { (image, url) in
            self.imageView.image = image
        }
    
    }
}

extension RecipieViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return recipie?.ingredients.count ?? 0
        case 1:
            return recipie?.steps.count ?? 0
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
            //cell.nameLabel.text = recipie?.ingredients[indexPath.item].name
            //cell.quantityLabel.text = recipie?.ingredients[indexPath.item].quantity
            cell.configure(recipie?.ingredients[indexPath.item])
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "StepCell", for: indexPath) as! StepCell
            cell.configure(insturctions: recipie?.steps[indexPath.item], time: recipie?.timers[indexPath.item])
            return cell
        case 2:
            fallthrough
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SourceCell", for: indexPath) as! SourceCell
            cell.configure(url: recipie!.originalURL, parentViewController: self)
            return cell
        }
    }
}



