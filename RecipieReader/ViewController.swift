//
//  ViewController.swift
//  RecipieReader
//
//  Created by Anna Nguyen on 9/26/17.
//  Copyright © 2017 Anna Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchData()
    }

    func fetchData() {
        let url = URL(string: "https://git.io/vdtMM")!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url){ (data, response, err) in
            let data = data!
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            let array = json as! [[String: Any]]
            let recipies = array.map { Recipe(dictionary: $0)}
            print(recipies)
        }
        task.resume()
    }

}

