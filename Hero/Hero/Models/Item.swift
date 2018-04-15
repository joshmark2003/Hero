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
