//
//  ItemStore.swift
//  Homepwner
//
//  Created by Lorenzo Llamas on 2/28/16.
//  Copyright © 2016 FinesseFilm Productions. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
//    init() {
//        for _ in 0..<5 {
//            createItem()
//            
//        }
//    }
    func removeItem(item: Item) {
        if let index = allItems.indexOf(item) {
            allItems.removeAtIndex(index)
        }
    }
    
    func moveItemAtIndex(fromIndex: Int, toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        //get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        //remove item from array
        allItems.removeAtIndex(fromIndex)
        
        //insert item in array  at new location
        allItems.insert(movedItem, atIndex: toIndex)
        
    }
}
