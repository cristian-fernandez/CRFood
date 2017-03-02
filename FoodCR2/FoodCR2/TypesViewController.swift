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
        let typecontroller = TypeController()
        
        self.typeArray = typecontroller.Read()
    
        self.tableTypes.reloadData()
        
    }
    
    
}
