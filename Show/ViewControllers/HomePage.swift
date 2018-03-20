//
//  HomePage.swift
//  Show
//
//  Created by Gbenga Ayobami on 2018-03-20.
//  Copyright © 2018 Gbenga Ayobami. All rights reserved.
//

import UIKit

class HomePage: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    let modelCategories = ["Editorial", "Runway/Catwalk", "Street", "Plus-Size", "Transgender", "Underwear/Lingerie", "Fitness/Fit", "Commercial", "Petit", "Glamour", "Sports", "Mature", "Parts", "African" ]
    let imageNames = ["editorial", "runway", "street", "plus-size", "trans", "lingerie", "fitness", "commercial", "petit", "glamour", "sport", "mature", "parts", "african"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.navigationController?.navigationBar.topItem?.title = "Modeling"
        // Do any additional setup after loading the view.
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width-20)/2, height: (self.collectionView.frame.size.height)/2.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomePageCollectionCell
        cell.imageView.image = UIImage(named: self.imageNames[indexPath.row])
        if ((self.modelCategories[indexPath.row] == "Plus-Size") || (self.modelCategories[indexPath.row] == "Mature")){
            cell.categoryLabel.textColor = .black
        }
        cell.categoryLabel.text = self.modelCategories[indexPath.row]
        cell.layer.cornerRadius = 10
        return cell
    }
}
