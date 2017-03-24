//
//  TypeService.swift
//  FoodCR2
//
//  Created by Alejandro Quiros on 2/14/17.
//  Copyright © 2017 rafa. All rights reserved.
//


import Foundation
import CoreData
import Alamofire
import AlamofireObjectMapper


class TypeService{
    
    
    var url: String?
    
    let TYPE_URL_SERVICE = "http://localhost:3000/types.json"
    
    
    init() {}
    
    
    func save(type: cType) {
        
        
    }
    
    func getTypes() //read from service, store in core data
    {
        print("getTypes from service")
        
        //Logic to not read all allways
        if let retreivedSettings = Set.loadSettingsFromDisk() { //read from Configs file
            print("loaded \(retreivedSettings.count) settings from disk")
            
            if retreivedSettings.count == 0{ //first time get all types
                self.url = TYPE_URL_SERVICE
            }
            else {  //only new ones
                self.url = TYPE_URL_SERVICE+"?types_filter=" + retreivedSettings[0].setting!
            }
            
        } else { //fail read config file get all types
            print("failed read from disk get all")
            self.url = TYPE_URL_SERVICE
        }
        
        
        //Alamofire call to fetch location data
        Alamofire.request(self.url!).responseArray { (response: DataResponse<[cType]>) in
            let realm = RealmManager();
            let typeArray = response.result.value
            
            if let typeArray = typeArray {
                
                for type in typeArray {
                    realm.insertObjectInDB(realmObject: type)
                    
                    
                    print(type.id)
                    print(type.name)
                    print(type.updated_at)
                    
                    
                    //save setting
                    let dateUpdated = Set(setting: type.updated_at)
                    let settingsArray = [dateUpdated]
                    Set.saveSettingsToDisk(settings: settingsArray)
                    
                }
            }
        }
    }
    
    func Read() -> Array<cType>{
        let realm = RealmManager();
        let results = realm.getAllTypes()
        var ctypes = [cType]()
        
        for type in results {
            let ctype = cType()
            ctype.id = type.id
            ctype.name = type.name
            
            ctypes.append(ctype)
            
        }
        
        return ctypes
    }
    
    
    
    
}
