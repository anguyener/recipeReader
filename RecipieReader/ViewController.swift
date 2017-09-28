//
//  ViewController.swift
//  RecipieReader
//
//  Created by Anna Nguyen on 9/26/17.
//  Copyright © 2017 Anna Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var recipies: [Recipe] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        fetchData()
    }

    func fetchData() {
        let url = URL(string: "https://git.io/vdtMM")!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url){ (data, response, err) in
            let data = data!
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            let array = json as! [[String: Any]]
         //   let recipies = array.map { Recipe(dictionary: $0)}
            self.recipies = array.map { Recipe(dictionary: $0)}
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipie = recipies[indexPath.item]
        let cell  = tableView.dequeueReusableCell(withIdentifier: "RecipieCell", for: indexPath) as! RecipieCell
        cell.recipieNameLabel.text = recipie.name
        return cell
    }
    
}
