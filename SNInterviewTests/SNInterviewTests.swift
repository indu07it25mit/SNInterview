//
//  SNInterviewTests.swift
//  SNInterviewTests
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import XCTest
@testable import SNInterview

class SNInterviewTests: XCTestCase {
    
    var sut: DashboardViewModel!

    override func setUp() {
        InjectedValues[\.service] = MockedNetworkService()
        
        sut = DashboardViewModel()
        sut.loadData()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoffeeShop() {
        XCTAssertNil(sut.errorMessage)
        let coffeeShop = sut.getCoffeeShop(at: 0)
        XCTAssertEqual(coffeeShop.name, "Lofty")
        XCTAssertEqual(coffeeShop.review, "Knowledgeable staff, stacked menu. Trust the Ethiopian in a pour over if you know your flavors. Will be back for the rest of this menu soon.")
        XCTAssertEqual(coffeeShop.rating, 4)
    }
    
    func testLoadFromJSON() {
        // TODO: load coffee shops from json and make sure they are loaded correctly
    }
}
