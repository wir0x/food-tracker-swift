//
//  RaitingControl.swift
//  FoodTracker
//
//  Created by Gonzalo Salazar Velasquez on 12/30/15.
//  Copyright © 2015 Gonzalo Salazar Velasquez. All rights reserved.
//

import UIKit

class RaitingControl: UIView {
    
    // MARK: Properties
    
    var rating = 0 { didSet { setNeedsLayout() } }
    var stars = 5
    var spacing = 5
    var ratingButtons = [UIButton]()
    
    
    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        

        let emptyStarImage = UIImage(named: "emptyStar")
        let filledStarImage = UIImage(named: "filledStar")

        
        for _ in 0..<stars {
            let button = UIButton()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState:[.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents:.TouchDown)
            ratingButtons.append(button)
            addSubview(button)
            
        }
    }
    
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the fram's height.
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset eatch button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * stars
        return CGSize(width: width, height: buttonSize)
    }
    
    
    // MARK: Button Action
    
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerate() {
            // If the index of a buttons is less than the rating, that button shoud be selected
            button.selected = index < rating
        }
    }
    
}
