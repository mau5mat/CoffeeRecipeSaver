//
//  MethodCollectionViewCell.swift
//  CoffeeRecipeSaver
//
//  Created by Matt Roberts on 22/10/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import Foundation
import UIKit

class MethodCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var methodImage: UIImageView!
  @IBOutlet weak var methodName: UILabel!
  
  func setup(withImage image: UIImage, andName name: String) {
    self.methodImage.image = image
    self.methodName.text = name
  }
}
