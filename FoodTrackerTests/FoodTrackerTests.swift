//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Gonzalo Salazar Velasquez on 11/28/15.
//  Copyright © 2015 Gonzalo Salazar Velasquez. All rights reserved.
//

import XCTest


class FoodTrackerTests: XCTestCase {
    
    // MARK: FoodTracker Tests
    
    
    // Test to confirm that the Meal initializer return when no name or a negative rating is provided.
    func testMealInitialization() {
        // Success case.
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // Failure cases.
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative rating are ivalid, be positive")
    }
}
