//
//  RecipeTableViewCell.swift
//  CoffeeRecipeSaver
//
//  Created by Matt Roberts on 23/10/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

  // MARK: - IBOutlets
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  
  // Not 100% sure how the date gets implemented yet, so set to String until I figure it out
  func setup(withTitle title: String, andDate date: String) {
    titleLabel.text = title
    dateLabel.text = date
  }
}
