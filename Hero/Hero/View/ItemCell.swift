//
//  ItemCell.swift
//  Hero
//
//  Created by Joshua Thompson on 15/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    var viewModel: ItemCellViewModel? {
        didSet {
            bind()
        }
    }
    
    private func bind() {
        guard let viewModel = viewModel else {
            return
        }
        
        nameLabel.text = viewModel.item.name
        brandLabel.text = viewModel.item.brand_name
        ingredientsLabel.text = viewModel.item.ingredients
    }
}
