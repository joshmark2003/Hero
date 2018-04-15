//
//  Service.swift
//  HeroTests
//
//  Created by Joshua Thompson on 15/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import XCTest
@testable import Hero

class ReportServiceTests: XCTestCase {
    
    var session: URLSessionMock!
    var service: Service!
    var items: [Item]!
    var parsingError: RequestError?
    
    override func setUp() {
        super.setUp()
        session = URLSessionMock()
        service = Service(session: session)
    }
    
    override func tearDown() {
        session = nil
        service = nil
        items = nil
        parsingError = nil
        super.tearDown()
    }
    
    func test_WhenItemsIsRequested_ReturnsItems() {
        let signalExpectation = expectation(description: "The URL was downloaded")
        let jsonString = Fixture.getJSON(jsonPath: "Items")
        let data = jsonString?.data(using: String.Encoding.utf8)
        
        session.data = data
        
        service.getItems(completionHandler: { (items, error) in
            self.items = items
            self.parsingError = error
            signalExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 5) { _ in
            XCTAssertNil(self.parsingError, "Error is nil when we get items data")
            XCTAssertNotNil(self.items, "Items should not be nil")
        }
    }
    
    func test_URLIsInvalid_ReturnsError() {
        let signalExpectation = expectation(description: "The URL was not downloaded")
        
        service.baseURL = "Invalid URL"
        service.getItems(completionHandler: { (items, error) in
            self.items = items
            self.parsingError = error
            signalExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 5) { _ in
            XCTAssertEqual(self.parsingError, RequestError.invalidURL, "Error is not nil when url is invalid")
            XCTAssertNil(self.items, "Items should be nil")
        }
    }
    
    func test_WhenResponseDataIsNil_ReturnError() {
        let signalExpectation = expectation(description: "The URL was downloaded")
        
        service.getItems(completionHandler: { (items, error) in
            self.items = items
            self.parsingError = error
            signalExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 5) { _ in
            XCTAssertEqual(self.parsingError, RequestError.unknown, "Error should be mapped to unknown")
            XCTAssertNil(self.items, "Items should be nil")
        }
    }
}
