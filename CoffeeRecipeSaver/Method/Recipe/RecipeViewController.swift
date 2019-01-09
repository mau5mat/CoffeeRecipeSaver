//
//  RecipeViewController.swift
//  CoffeeRecipeSaver
//
//  Created by Matt Roberts on 23/10/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import Foundation
import UIKit

class RecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  // MARK: - Navigation
  static func push(from viewController: UIViewController, withMethodName name: String) {
    if let recipeViewController = UIStoryboard(name: "Recipe", bundle: nil).instantiateViewController(withIdentifier: "RecipeViewController") as? RecipeViewController {
      viewController.navigationController?.pushViewController(recipeViewController, animated: true)
      print("This function is getting called on tap!")
    }
  }
  
  // MARK: - Variables
  lazy var refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.tintColor = .black
    refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
    return refreshControl
  }()
  
  // MARK: - IBOutlets
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Dummy Data
  let dummyData = [
    Recipe(recipeTitle: "Morning Brew", recipeDate: "9 Aug 1992"),
    Recipe(recipeTitle: "16g beans 78g water", recipeDate: "6th Sept 2018"),
    Recipe(recipeTitle: "cold brew", recipeDate: "20th Oct 1999"),
    Recipe(recipeTitle: "New beans", recipeDate: "9/10/2018"),
    Recipe(recipeTitle: "old faithful", recipeDate: "2nd Feb 2017")
  ]
  
  var dummyData2 = [
    Recipe(recipeTitle: "Morning Brew", recipeDate: "9 Aug 1992"),
    Recipe(recipeTitle: "16g beans 78g water", recipeDate: "6th Sept 2018"),
    Recipe(recipeTitle: "cold brew", recipeDate: "20th Oct 1999"),
    Recipe(recipeTitle: "New beans", recipeDate: "9/10/2018"),
    Recipe(recipeTitle: "old faithful", recipeDate: "2nd Feb 2017")
  ]
  
  @objc func requestData() {
    print("Fetching data ..")
    let timeToGetData = DispatchTime.now() + .milliseconds(1500)
    
    DispatchQueue.main.asyncAfter(deadline: timeToGetData) {
      print("Got data, stop refreshing!")
      self.refreshControl.endRefreshing()
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.refreshControl = refreshControl
    setupNib()
  }
  
  // MARK: - Nib Registration
  private func setupNib() {
    //                                          *** REMEMBER TO REGISTER NIB IN FUTURE ***
    let nib = UINib(nibName: "RecipeTableViewCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: "RecipeTableViewCell")
  }
  
  // MARK: - TableView Delegate Functions
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dummyData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCell", for: indexPath) as! RecipeTableViewCell
    cell.setup(withTitle: dummyData[indexPath.row].recipeTitle, andDate: dummyData[indexPath.row].recipeDate)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      EntryViewController.push(from: self, withMethodName: "methodNameOfCell") // <-- This should be the methodName of the BrewMethod of the TableViewCell
    }
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    guard editingStyle == .delete else { return }
    
    dummyData2.remove(at: indexPath.row)
    tableView.deleteRows(at: [indexPath], with: .automatic)
    
  }
}
