//
//  FoodViewController.swift
//  FoodCR2
//
//  Created by Cristian Fernandez on 3/2/17.
//  Copyright © 2017 rafa. All rights reserved.
//
import RealmSwift

class FoodViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var FoodArray = Array<cFood>()
    var typeID = 0
    let leftAndRightPaddings = CGFloat(32.0);
    let numberOfItemsPerRow = CGFloat(3.0);
    let heigthAdjustment = CGFloat(30.0);
    
    @IBOutlet weak var FoodCollectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        loadFood()
    }
    
    func loadFood(){
        let realManager = RealmManager();
        typeID = 4
        //FoodArray = realManager.getFoodsWithTypeName(typeName: TypeName)
        print("getTypes from coredata")
        let foodService = FoodService()
        
        self.FoodArray = foodService.Read(typeID: typeID)
        
        FoodCollectionView.reloadData()

}
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FoodArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! FoodCollectionViewCell
        
        let foodToShow = FoodArray[indexPath.row];
        
        cell.foodImageView.image = UIImage(named: foodToShow.imageName)
        cell.foodNameLabel.text = foodToShow.name;
        
        return cell;
    }
    
    private struct Storyboard
    {
        static let CellIdentifier = "FoodCollectionViewCell"
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = CGFloat((self.view.bounds.width - leftAndRightPaddings) / numberOfItemsPerRow)
        return CGSize(width: width, height: width + heigthAdjustment);
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5,5,5,5)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
        /*let nextViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController"))! as! DetailViewController
        
        Food *foodSelected = self.FoodArray[indexPath.row];
        nextViewController.FoodName = foodSelected.FoodName;
        
        self.presentViewController(nextViewController, animated:true, completion:nil)*/
    }
}
