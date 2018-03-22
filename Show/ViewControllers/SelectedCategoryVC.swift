//
//  SelectedCategoryVC.swift
//  Show
//
//  Created by Gbenga Ayobami on 2018-03-21.
//  Copyright © 2018 Gbenga Ayobami. All rights reserved.
//

import UIKit

class SelectedCategoryVC: UIViewController {

    @IBOutlet weak var collectionView:UICollectionView!
    
    let modelCategories = ["Editorial", "Runway/Catwalk", "Street", "Plus-Size", "Transgender", "Underwear/Lingerie", "Fitness/Fit", "Commercial", "Petit", "Glamour", "Sports", "Mature", "Parts", "African" ]
    let imageNames = ["editorial", "runway", "street", "plus-size", "trans", "lingerie", "fitness", "commercial", "petit", "glamour", "sport", "mature", "parts", "african"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SelectedCategoryVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func imageWithImage(sourceImage:UIImage, scaledToWidth: CGFloat) -> UIImage {
        let oldWidth = sourceImage.size.width
        let scaleFactor = scaledToWidth / oldWidth
        
        let newHeight = sourceImage.size.height * scaleFactor
        let newWidth = oldWidth * scaleFactor
        
        UIGraphicsBeginImageContext(CGSize(width:newWidth, height:newHeight))
        sourceImage.draw(in: CGRect(x:0, y:0, width:newWidth, height:newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.modelCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCell", for: indexPath) as! FeedCell
        let image = UIImage(named: imageNames[indexPath.row])
        let targetSize = CGSize(width: 287, height: 227)
        print("BEFORE:", image?.size.width, image?.size.height)
        cell.imageView.image = resizeImage(image: image!, targetSize: targetSize)
        cell.imageView.contentMode = .scaleAspectFill
        print("AFTER:", cell.imageView.image?.size.width, cell.imageView.image?.size.height)
        return cell
    }
}
