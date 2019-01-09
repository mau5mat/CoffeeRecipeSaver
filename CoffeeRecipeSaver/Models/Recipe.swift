//
//  Recipe.swift
//  CoffeeRecipeSaver
//
//  Created by Matt Roberts on 22/10/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import Foundation
import UIKit

struct Recipe {
  let recipeTitle: String
  let recipeDate: String // Subject to change
  
  init(recipeTitle: String, recipeDate: String) {
    self.recipeTitle = recipeTitle
    self.recipeDate = recipeDate
  }
}
