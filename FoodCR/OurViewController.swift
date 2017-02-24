//
//  OurViewController.swift
//  FoodCR2
//
//  Created by Alejandro Quiros on 2/8/17.
//  Copyright © 2017 rafa. All rights reserved.
//

import UIKit

class OurViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        let typeController = TypeController()
        typeController.getTypes()  //Get from service
        
        let realm = RealmManager()
        let types = realm.getAllTypes()

        for type in types {
            print(type.id)
            print(type.name)
            
        }
    }


}
