//
//  CollectionViewController.swift
//  RecipieReader
//
//  Created by Anna Nguyen on 10/10/17.
//  Copyright © 2017 Anna Nguyen. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    var recipies: [Recipe] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
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
                self.collectionView.reloadData()
            }
        }
        task.resume()
    }
    
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrowserCell", for: indexPath) as! BrowserCell
       // cell.nameLabel.text = recipies[indexPath.item].name
        //cell.stepsLabel.text = "steps: \(recipies[indexPath.item].steps.count)"
        //ImageService.shared.imageForURL(url: recipies[indexPath.item].imageURL) { (image) in
         //   cell.imageView.image = image
    //    cell.configure(recipie: recipies[indexPath.item])
        cell.recipie = recipies[indexPath.item]
        return cell
    }
    
    
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let recipieViewController = storyboard.instantiateViewController(withIdentifier: "RecipieViewController") as! RecipieViewController
        recipieViewController.recipie = recipies[indexPath.item]
       // present(recipieViewController, animated: true, completion: nil)
        navigationController?.pushViewController(recipieViewController, animated: true)
    }
}
