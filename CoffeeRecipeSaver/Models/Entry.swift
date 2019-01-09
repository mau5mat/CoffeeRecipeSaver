//
//  Entry.swift
//  CoffeeRecipeSaver
//
//  Created by Matt Roberts on 24/10/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import Foundation
import UIKit

struct Entry {
  let entryTitle: String
  let entryTextView: String
  
  init(entryTitle: String, entryTextView: String) {
    self.entryTitle = entryTitle
    self.entryTextView = entryTextView
  }
}
