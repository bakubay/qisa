//
//  CategoryButtonsCollection.swift
//  qurie
//
//  Created by mac on 8/9/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class CategoryButtonsCollection: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var recievedTimeAndTheme:(time: String?,theme: String?)
    
    var categoryButton = [CategoryItem.init(image: #imageLiteral(resourceName: "Scary"), title: "Be Frightened", color: #colorLiteral(red: 0.9333333333, green: 0.5333333333, blue: 0.537254902, alpha: 1)),
                          CategoryItem.init(image: #imageLiteral(resourceName: "ChangeUniverse"), title: "Sci-Fi", color: #colorLiteral(red: 0.8235294118, green: 0.7098039216, blue: 0.9647058824, alpha: 1) ),
                          CategoryItem.init(image: #imageLiteral(resourceName: "Romance"), title: "Romance", color: #colorLiteral(red: 0.8235294118, green: 0.7098039216, blue: 0.9647058824, alpha: 1)),
                          CategoryItem.init(image: #imageLiteral(resourceName: "Comedy"), title: "Laugh", color: #colorLiteral(red: 0.9333333333, green: 0.5333333333, blue: 0.537254902, alpha: 1)),
                          CategoryItem.init(image: #imageLiteral(resourceName: "Daily"), title: "Daily Moment", color: #colorLiteral(red: 0.9333333333, green: 0.5333333333, blue: 0.537254902, alpha: 1)),
                          CategoryItem.init(image: #imageLiteral(resourceName: "Childstory"), title: "Childhood", color: #colorLiteral(red: 0.8235294118, green: 0.7098039216, blue: 0.9647058824, alpha: 1))]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryButton.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryButtonCell", for: indexPath) as! CategoryButtonCell
        
        cell.displayButtonContent(image: categoryButton[indexPath.row].image, title: categoryButton[indexPath.row].title, color: categoryButton[indexPath.row].color)
        cell.categoryButtonImage.contentMode = .scaleAspectFit

        cell.applyCellDesign()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0://investigate- be frightened
            recievedTimeAndTheme.theme = "23"
        case 1://change universe
            recievedTimeAndTheme.theme = "26"
        case 2://romantic
            recievedTimeAndTheme.theme = "24"
        case 3://smileLaugh
            recievedTimeAndTheme.theme = "28"
        case 4://daily
            recievedTimeAndTheme.theme = "29"
        case 5://childhood
            recievedTimeAndTheme.theme = "30"
        default:
            recievedTimeAndTheme.theme = ""
        }
        performSegue(withIdentifier: "CategoryIsChosen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CategoryIsChosen"{
            let destinationVC = segue.destination as! StoryDisplayer
            destinationVC.recievedTimeAndTheme = recievedTimeAndTheme
        }
        
    }
    
    
    @IBOutlet weak var ButtonsCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension UICollectionViewCell{
    func applyCellDesign(){
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.75
        self.clipsToBounds = false
        self.layer.masksToBounds = false
    }
}
