//
//  cFood.swift
//  FoodCR2
//
//  Created by Cristian Fernandez on 3/2/17.
//  Copyright © 2017 rafa. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift


class cFood: Object, Mappable {
    
    dynamic var id = 0
    dynamic var name = ""
    dynamic var idType = ""
    dynamic var averageRating = ""
    dynamic var language = ""
    dynamic var updated_at = ""
    dynamic var imageName = ""
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    
    func mapping(map: Map) {
        name <- map["name"]
        id  <- map["id"]
        idType <- map["idType"]
        averageRating <- map["averageRating"]
        language <- map["language"]
        updated_at <- map["dateUpdated"]
    }
    
}
