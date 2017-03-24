//
//  TypesViewController.swift
//  FoodCR2
//
//  Created by Alejandro on 2/27/17.
//  Copyright © 2017 rafa. All rights reserved.
//

import UIKit

class TypesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var jsonArray: NSMutableArray?
    var newArray: Array<String> = []
    var selectedIndex = -1
    var typeArray = Array<cType>()
    
    
    @IBOutlet var tableTypes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readTypes() //Read types from core
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.typeArray.count
    }
    
    
   
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(selectedIndex == indexPath.row) {
            return 100;
        } else {
            return 40;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! customCell
        
        //tipo de comida
        cell.name.text = self.typeArray[indexPath.row].name
        
        return cell;
    }
    
    
    func readTypes()//read from core data put in list view
    {
        print("getTypes from coredata")
        let typeService = TypeService()
        
        self.typeArray = typeService.Read()
    
        self.tableTypes.reloadData()
        
    }
    func tableView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
        let nextViewController = (self.storyboard?.instantiateViewController(withIdentifier: "FoodViewController"))! as! FoodViewController
         
         //Food *foodSelected = self.FoodArray[indexPath.row];
         //nextViewController.FoodName = foodSelected.FoodName;
         
         self.present(nextViewController, animated:true, completion:nil)
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //println(tasks[indexPath.row])
        var i = indexPath
    }
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
//        if(selectedIndex == indexPath.row) {
//            selectedIndex = -1
//        } else {
//            selectedIndex = indexPath.row
//        }
//    }
    
    //
    //        let nextViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("PublishersCollectionViewController"))! as! PublishersCollectionViewController
    //        //self.navigationController?.setViewControllers([viewController], animated: true)
    //        //self.navigationController?.pushViewController(nextViewController, animated: true)
    //        self.presentViewController(nextViewController, animated:true, completion:nil)
    //        //self.prese
    ////        PublishersCollectionViewController *nextViewController =    [self.storyboard instantiateViewControllerWithIdentifier:@"PublishersCollectionViewController"];
    //
    //        //nextViewController.categoryName = self.categoryName;
    //        [self.navigationController pushViewController:nextViewController animated: YES];
    //
    
    
    /*self.tableTypes.beginUpdates()
     self.tableTypes.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic )
     self.tableTypes.endUpdates()*/
    
    
    
    
    //  }

    
}
