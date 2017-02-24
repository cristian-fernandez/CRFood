//
//  Set.swift
//  FoodCR2
//
//  Created by Alejandro on 2/17/17.
//  Copyright © 2017 rafa. All rights reserved.
//

import UIKit


class Set:  NSObject, NSCoding {

    var setting: String? = ""
    
    init(setting: String!) {
        self.setting = setting
        
        super.init()
    }
    
    func encode(with encoder: NSCoder) {
        encoder.encode(setting, forKey: "setting")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let unarchivedName = aDecoder.decodeObject(forKey: "setting") as? String
            else{
                return nil
        }
        self.init(setting: unarchivedName)
        
    }
    
    
    class func saveSettingsToDisk(settings: [Set]) {
     
        let encodeData = NSKeyedArchiver.archivedData(withRootObject: settings)
        UserDefaults.standard.set(encodeData, forKey: "setting")
    }
    
    class func loadSettingsFromDisk() -> [Set]? {
        
        
        var settings = [Set]()
        let data = UserDefaults.standard.data(forKey: "setting")
        
        if data != nil {
        settings = (NSKeyedUnarchiver.unarchiveObject(with: data!) as? [Set])!
        }
        
        return settings
}


}






