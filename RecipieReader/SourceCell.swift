//
//  SourceCell.swift
//  RecipieReader
//
//  Created by Anna Nguyen on 10/3/17.
//  Copyright © 2017 Anna Nguyen. All rights reserved.
//

import UIKit
import SafariServices

class SourceCell: UITableViewCell {
    
    var url: URL!
    var parentViewController: UIViewController!
    
    func configure(url: URL, parentViewController: UIViewController) {
        self.url = url
        self.parentViewController = parentViewController
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        let safariVC = SFSafariViewController(url: url)
      //  parentViewController.present(safariVC, animated: true, completion: nil)
        parentViewController.navigationController?.pushViewController(safariVC, animated: true)
        
    }
}
