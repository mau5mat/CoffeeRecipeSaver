//
//  EntryViewController.swift
//  CoffeeRecipeSaver
//
//  Created by Matt Roberts on 23/10/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import Foundation
import UIKit

class EntryViewController: UIViewController, UITextViewDelegate {
  
  // MARK: - Navigation
  static func push(from viewController: UIViewController, withMethodName name: String) {
    if let entryViewController = UIStoryboard(name: "Entry", bundle: nil).instantiateViewController(withIdentifier: "EntryViewController") as? EntryViewController {
      viewController.navigationController?.pushViewController(entryViewController, animated: true)
      print("This function is getting called on tap!")
    }
  }
  
  // MARK: - IBOutlets
  @IBOutlet weak var titleTextView: UITextView!
  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var saveButton: UIButton!
  @IBOutlet weak var cancelButton: UIButton!
  
  // MARK: - Dummy Data
  let dummyData = [
    Entry(entryTitle: "My favorite Coffee Recipe", entryTextView: "blahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblah"),
    Entry(entryTitle: "Aeropress", entryTextView: "blahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblah"),
    Entry(entryTitle: "Pour over goodness", entryTextView: "blahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblah"),
    Entry(entryTitle: "Moka pot - Columbian style", entryTextView: "blahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblah"),
    Entry(entryTitle: "Morning wake up cup", entryTextView: "blahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblah"),
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    self.textView.delegate = self
    setupTitleLabel()
    setupTextView()
    setupSaveButton()
    setupCancelButton()
  }
  
  // MARK: - TextView Delegate Functions
  func textViewDidChange(_ textView: UITextView) {

  }
  
  
  // MARK: - Setup Functions
  private func setupTitleLabel() {
    self.titleTextView.font = UIFont(name: "Veranda", size: 18)
    self.titleTextView.textColor = UIColor.black
  }
  
  private func setupTextView() {
    self.textView.font = UIFont(name: "Veranda", size: 16)
    self.textView.textColor = UIColor.black
  }
  
  private func setupSaveButton() {
    self.saveButton.backgroundColor = UIColor.blue
    print("The save button was tapped!")
  }
  
  private func setupCancelButton() {
    self.cancelButton.backgroundColor = UIColor.red
    print("The cancel button was tapped!")

  }
  
}
