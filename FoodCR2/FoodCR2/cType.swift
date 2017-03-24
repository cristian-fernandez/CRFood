//
//  cType.swift
//  CostaRica Food Guide
//
//  Created by Alejandro on 8/8/16.
//  Copyright © 2016 Mistic Labs. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift


class cType: Object, Mappable {
    
    dynamic var id = 0
    dynamic var name = ""
    dynamic var updated_at = ""
    let foods = List<cFood>()
    
  
    required convenience init?(map: Map) {
        self.init()
    }
    
    
    func mapping(map: Map) {
        name <- map["name"]
        id  <- map["id"]
        updated_at <- map["updated_at"]
    }
    
}
