//
//  ServiceMock.swift
//  HeroTests
//
//  Created by Joshua Thompson on 15/04/2018.
//  Copyright © 2018 Joshua Thompson. All rights reserved.
//

import Foundation

@testable import Hero

class ServiceMock: ServiceProtocol {
    
    var errorMock: RequestError? = nil
    var getItemsMock: [Item]? = nil
    
    func getItems(completionHandler: @escaping ([Item]?, RequestError?) -> Void) {
        completionHandler(getItemsMock, errorMock)
    }
}
