//
//  Item.swift
//  Hero
//
//  Created by Joshua Thompson on 15/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import Foundation

struct Item: Decodable {
    let gtin14: String?
    let brand_name: String?
    let name: String?
    let size: String?
    let ingredients: String?
    let serving_size: String?
    let servings_per_container: String?
    let calories: Int?
    let fat_calories: Int?
    let fat: String?
    let saturated_fat: String?
    let trans_fat: String?
    let polyunsaturated_fat: String?
    let monounsaturated_fat: String?
    let cholesterol: Int?
    let sodium: Int?
    let potassium: Int?
    let carbohydrate: Int?
    let fiber: Int?
    let sugars: Int?
    let protein: Int?
    let images: [Images?]?
}

extension Item {
    static func fakeItem1() -> Item {
        let item = Item(gtin14: "gtin14", brand_name: "brand_name", name: "first name", size: "size", ingredients: "ingredients", serving_size: "serving_size", servings_per_container: "servings_per_container", calories: 12, fat_calories: 12, fat: "fat", saturated_fat: "saturated_fat", trans_fat: "trans_fat", polyunsaturated_fat: "polyunsaturated_fat", monounsaturated_fat: "fat", cholesterol: 21, sodium: 12, potassium: 45, carbohydrate: 78, fiber: 55, sugars: 2, protein: 46, images: [])
        
        return item
    }
    
    static func fakeItem2() -> Item {
        let item = Item(gtin14: "gtin14", brand_name: "brand_name", name: "second name", size: "size", ingredients: "ingredients", serving_size: "serving_size", servings_per_container: "servings_per_container", calories: 12, fat_calories: 12, fat: "fat", saturated_fat: "saturated_fat", trans_fat: "trans_fat", polyunsaturated_fat: "polyunsaturated_fat", monounsaturated_fat: "fat", cholesterol: 21, sodium: 12, potassium: 45, carbohydrate: 78, fiber: 55, sugars: 2, protein: 46, images: [])
        
        return item
    }
    
    static func fakeItemNoName() -> Item {
        let item = Item(gtin14: "gtin14", brand_name: "brand_name", name: nil, size: "size", ingredients: "ingredients", serving_size: "serving_size", servings_per_container: "servings_per_container", calories: 12, fat_calories: 12, fat: "fat", saturated_fat: "saturated_fat", trans_fat: "trans_fat", polyunsaturated_fat: "polyunsaturated_fat", monounsaturated_fat: "fat", cholesterol: 21, sodium: 12, potassium: 45, carbohydrate: 78, fiber: 55, sugars: 2, protein: 46, images: [])
        
        return item
    }
}
