//
//  ReviewDetailViewTest.swift
//  SNInterviewTests
//
//  Created by Inderjeet Kumar on 29/04/22.
//  Copyright © 2022 ServiceNow. All rights reserved.
//

import XCTest
@testable import SNInterview

class ReviewDetailViewTest: XCTestCase {
    var sut: ReviewViewModel!
    
    override func setUpWithError() throws {
        let dashboardVM = DashboardViewModel()
        dashboardVM.loadData()
        
        sut = ReviewViewModel()
        sut.setSelectedReview(dashboardVM.getCoffeeShop(at: 0))
    }
    
    func testReviewDetails() {
        XCTAssertEqual(sut.getSelectedReview()?.name, "Lofty")
        XCTAssertEqual(sut.getSelectedReview()?.review, "Knowledgeable staff, stacked menu. Trust the Ethiopian in a pour over if you know your flavors. Will be back for the rest of this menu soon.")
        XCTAssertEqual(sut.getSelectedReview()?.rating, 4)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
