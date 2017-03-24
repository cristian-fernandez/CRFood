//
//  FoodService.swift
//  FoodCR2
//
//  Created by Cristian Fernandez on 3/13/17.
//  Copyright © 2017 rafa. All rights reserved.
//


import Foundation
import CoreData
import Alamofire
import AlamofireObjectMapper


class FoodService{
    
    
    var url: String?
    
    let FOOD_URL_SERVICE = "http://localhost:3000/foods.json"
    
    
    init() {}
    
    
    func save(Food: cType) {
        
        
    }
    
    func getFoods() //read from service, store in realm
    {
        print("getFoods from service")
        
        //Logic to not read all allways
        if let retreivedSettings = Set.loadSettingsFromDisk() { //read from Configs file
            print("loaded \(retreivedSettings.count) settings from disk")
            
            if retreivedSettings.count == 0{ //first time get all Foods
                self.url = FOOD_URL_SERVICE
            }
            else {  //only new ones
                self.url = FOOD_URL_SERVICE+"?Foods_filter=" + retreivedSettings[0].setting!
            }
            
        } else { //fail read config file get all Foods
            print("failed read from disk get all")
            self.url = FOOD_URL_SERVICE
        }
        
        
        //Alamofire call to fetch location data
        Alamofire.request(self.url!).responseArray { (response: DataResponse<[cFood]>) in
            let realm = RealmManager();
            let foodArray = response.result.value
            
            if let foodArray = foodArray {
                
                //  let typecontroller = TypeController()
                
                for food in foodArray {
                    realm.insertObjectInDB(realmObject: food)
                    
                    
                    print(food.id)
                    print(food.name)
                    print(food.updated_at)
                    
                    
                    //save setting
                    let dateUpdated = Set(setting: food.updated_at)
                    let settingsArray = [dateUpdated]
                    Set.saveSettingsToDisk(settings: settingsArray)
                    
                }
            }
        }
    }
    
    func Read(typeID: Int) -> Array<cFood>{
        let realm = RealmManager();
        let results = realm.getFoodsWithTypeName(typeID: typeID)
        var cFoods = [cFood]()
        
        for food in results {
            let cfood = cFood()
            cfood.id = food.id
            cfood.name = food.name
            
            cFoods.append(cfood)
            
        }
        
        return cFoods
    }
    
    
    
    
}

