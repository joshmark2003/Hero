//
//  HomeViewModel.swift
//  Hero
//
//  Created by Joshua Thompson on 15/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol {
    var items: Dynamic<[Item]?> { get }
    var service: ServiceProtocol { get }

    func getItems()
    func sortByName(asc: Bool)
}

struct HomeViewModel: HomeViewModelProtocol {
    
    var items: Dynamic<[Item]?> = Dynamic(nil)
    let service: ServiceProtocol
    
    init(service: ServiceProtocol = Service.shared) {
        self.service = service
    }

    func getItems() {
        service.getItems(completionHandler: { (items, error) in
            //When we get an error, we can manage it from here and
            //display it accordingly
            
            //Remove any item with no name. We could filter more here
            let filteredName = items?.filter({ item -> Bool in
                item.name != nil
            })
            
            self.items.value = filteredName
        })
    }
    
    func sortByName(asc: Bool) {
        
        let sortedArray = items.value?.sorted {
            guard let name1 =  $0.name,
                let name2 = $1.name else {
                    return false
            }
            
            if asc {
                return name1.lowercased() < name2.lowercased()
            } else {
                return name1.lowercased() > name2.lowercased()
            }
        }
        self.items.value = sortedArray
    }
}
