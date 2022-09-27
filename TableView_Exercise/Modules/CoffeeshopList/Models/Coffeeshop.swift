//
//  Coffeeshop.swift
//  TableView_Exercise
//
//  Created by Bayu Yasaputro on 23/09/22.
//

import Foundation

/*
 {
    "name": "",
    "type": "",
    "location": "",
    "image": null
 }
 */

struct Coffeeshop {
    let name: String?
    let type: String?
    let location: String?
    let image: String?
    var isFavorite: Bool = false
    
    init(name: String?, type: String?, location: String?, image: String?, isFavorite: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isFavorite = isFavorite
    }
}
