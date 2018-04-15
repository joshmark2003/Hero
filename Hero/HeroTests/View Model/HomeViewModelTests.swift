//
//  HomeViewModelTests.swift
//  HeroTests
//
//  Created by Joshua Thompson on 15/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import XCTest

@testable import Hero

class HomeViewModelTests: XCTestCase {
    
    var service: ServiceMock!
    
    override func setUp() {
        super.setUp()
        service = ServiceMock()
    }
    
    override func tearDown() {
        service = nil
        super.tearDown()
    }
    
    func test_GetItems_ReturnsItems() {
        
        service.getItemsMock = [Item.fakeItem1(), Item.fakeItem2()]
        
        let viewModel = HomeViewModel(service: service)
        viewModel.getItems()
        
        service.getItems(completionHandler: { (items, error) in
            XCTAssertNotNil(items, "Items should not be nil")
            XCTAssertNil(error, "Error is nil when we get items data")
            XCTAssertEqual(viewModel.items.value?.count, items?.count, "Items should be equal")
        })
    }
    
    func test_WhenListHasItemWithNoName_ReturnsItemsWithNamesOnly() {
        
        service.getItemsMock = [Item.fakeItem1(), Item.fakeItem2(), Item.fakeItemNoName()]
        
        let viewModel = HomeViewModel(service: service)
        viewModel.getItems()
        
        service.getItems(completionHandler: { (items, error) in
            XCTAssertNotNil(viewModel.items, "Items should not be nil")
            XCTAssertNil(error, "Error is nil when we get items data")
            XCTAssertEqual(viewModel.items.value?.count, 2, "Items should be 2")
        })
    }
    
    func test_WhenListIsSortedByAsc_ReturnsSortedItems() {
        
        let viewModel = HomeViewModel(service: service)
        viewModel.items.value = [Item.fakeItem2(), Item.fakeItem1(), Item.fakeItemNoName()]
        viewModel.sortByName(asc: true)
        
        XCTAssertNotNil(viewModel.items, "Items should not be nil")
        XCTAssertEqual(viewModel.items.value?[0].name, "first name", "Items should be equal")
        XCTAssertEqual(viewModel.items.value?[1].name, "second name", "Items should be equal")
    }
    
    func test_WhenListIsSortedByDesc_ReturnsSortedItems() {
        
        let viewModel = HomeViewModel(service: service)
        viewModel.items.value = [Item.fakeItem2(), Item.fakeItem1(), Item.fakeItemNoName()]
        viewModel.sortByName(asc: false)
        
        XCTAssertNotNil(viewModel.items, "Items should not be nil")
        XCTAssertEqual(viewModel.items.value?[0].name, "second name", "Items should be equal")
        XCTAssertEqual(viewModel.items.value?[1].name, "first name", "Items should be equal")
    }
}
