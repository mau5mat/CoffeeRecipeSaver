//
//  BrewMethod.swift
//  CoffeeRecipeSaver
//
//  Created by Matt Roberts on 19/10/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import Foundation
import UIKit

enum BrewType: String {
  case aeroPress = "Aero Press"
  case frenchPress = "French Press"
  case pourOver = "Pour Over"
  case chemex = "Chemex"
  case mokaPot = "Moka pot"
}

struct BrewMethod {
  let methodName: BrewType
  let methodImage: UIImage
  
  init(methodName: BrewType, methodImage: UIImage) {
    self.methodName = methodName
    self.methodImage = methodImage
  }
}
