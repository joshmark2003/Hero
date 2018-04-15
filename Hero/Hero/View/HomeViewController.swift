//
//  HomeViewController.swift
//  Hero
//
//  Created by Joshua Thompson on 15/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    private func bind() {
        viewModel.getItems()
        viewModel.items.bind { [unowned self] items in
            guard let _ = items else {
                //Handle error if needed
                return
            }
            
            let range = NSMakeRange(0, self.tableView.numberOfSections)
            let sections = NSIndexSet(indexesIn: range)
            self.tableView.reloadSections(sections as IndexSet, with: .automatic)
        }
    }
    
    @IBAction func sortAction(_ sender: UIBarButtonItem) {
        let sortOptions = UIAlertController(title: nil, message: "Sort", preferredStyle: .actionSheet)
        
        let nameAscAction = UIAlertAction(title: "Name ascending", style: .default, handler: {
            action -> Void in
            self.viewModel.sortByName(asc: true)
        })
        
        let nameDecAction = UIAlertAction(title: "Name descending", style: .default, handler: {
            action -> Void in
            self.viewModel.sortByName(asc: false)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action -> Void in
        })
        
        sortOptions.addAction(nameAscAction)
        sortOptions.addAction(nameDecAction)
        sortOptions.addAction(cancelAction)
        
        present(sortOptions, animated: true, completion: nil)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = viewModel.items.value else {
            return 0
        }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ItemCell,
        let items = viewModel.items.value else {
                return UITableViewCell()
        }
        
        let item = items[indexPath.row]
        let cellViewModel = ItemCellViewModel(item: item)
        cell.viewModel = cellViewModel
        
        if indexPath.row % 2 == 0 {
            cell.contentView.backgroundColor = UIColor.white
        } else {
            let colour = UIColor(white: 0.9, alpha: 0.2)
            cell.contentView.backgroundColor = colour
        }
        
        return cell
    }
}
