//
//  Meal.swift
//  FoodTracker
//
//  Created by Gonzalo Salazar Velasquez on 12/31/15.
//  Copyright © 2015 Gonzalo Salazar Velasquez. All rights reserved.
//

import UIKit

public class Meal {
    // MARK: properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    
    // MARK: Initializer
    
    init? (name: String, photo: UIImage?, rating: Int) {
        // Initialize store properties
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Initialization should fail if there is no name or if the rating is negative
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}