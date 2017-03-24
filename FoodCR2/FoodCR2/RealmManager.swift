//
//  RealmManager.swift
//  TestSwift3
//
//  Created by Cristian Fernandez on 2/22/17.
//  Copyright © 2017 Cristian Fernandez. All rights reserved.
//

import RealmSwift


public class RealmManager {
    
    let realm = try! Realm()
    
    //Metodos genericos
    func insertObjectInDB(realmObject: Object){
        // Get the default Realm
        let realm = try! Realm()
        // You only need to do this once (per thread)
        
        // Add to the Realm inside a transaction
        try! realm.write {
            realm.add(realmObject)
        }
    }
    
    func getAllTypes() -> Results<cType>{
        if needsToInsertTypes() {
            //createDefaultTypes()
            //createDefaultFoods()
            //createDefaultDetails()
        }
        return realm.objects(cType.self)
    }
    
    func needsToInsertTypes() -> Bool {
        
        let types = realm.objects(cType.self)// retrieves all Types from the default Realm
        if types.count == 0 {
            return true
        }
        return false
    }
    
    func getFoodsWithTypeName(typeID: Int) -> List<cFood>{
        let type = getTypeWithID(typeID: typeID)
        return type.foods
    }
    
    func getTypeWithID(typeID: Int) -> cType{
       let predicate = NSPredicate(format: "name = %@ ", typeID)
       let types = realm.objects(cType.self).filter(predicate)
       return types.first!
    }
    
    func createFoodsWithTypesName(foodObject: cFood){
        var typeSelected = getTypeWithID(typeID:foodObject.id)
        //let food
        
    }
    
    
    /*
    +(void) createFoodsWithTypesName:(NSString*)typeName foodName:(NSString*)foodName image:(NSString*)image{
    Type *typeSelected = [self getTypeWithName:typeName];-
    Food *food = [Food new];
    food.FoodName = foodName;
    food.type = typeSelected;
    food.Image = image;
    [self insertObjectInDB:food];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [typeSelected.food addObject:food];
    [realm commitWriteTransaction];
    }
 */
}
