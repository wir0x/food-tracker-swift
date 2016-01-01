//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Gonzalo Salazar Velasquez on 12/31/15.
//  Copyright © 2015 Gonzalo Salazar Velasquez. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var nameLabel: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RaitingControl!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
