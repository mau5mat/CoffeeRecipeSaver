//
//  MethodViewController.swift
//  CoffeeRecipeSaver
//
//  Created by Matt Roberts on 18/10/2018.
//  Copyright © 2018 Matt Roberts. All rights reserved.
//

import UIKit

class MethodViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

  // MARK: - Navigation
  static func push(from viewController: UIViewController) {
    if let methodViewController = UIStoryboard(name: "Method", bundle: nil).instantiateViewController(withIdentifier: "MethodViewController") as? MethodViewController {
      viewController.navigationController?.pushViewController(methodViewController, animated: true)
      print("This function is getting called on tap!")
    }
  }
  
  // MARK: - IBOutlets
  @IBOutlet weak var collectionView: UICollectionView!
  
  // MARK: - Dummy Data
  let dummyData = [
    BrewMethod(methodName: .aeroPress, methodImage: UIImage(imageLiteralResourceName: "aeropress")),
    BrewMethod(methodName: .chemex, methodImage: UIImage(imageLiteralResourceName: "chemex")),
    BrewMethod(methodName: .frenchPress, methodImage: UIImage(imageLiteralResourceName: "frenchpress")),
    BrewMethod(methodName: .mokaPot, methodImage: UIImage(imageLiteralResourceName: "mokapot")),
    BrewMethod(methodName: .pourOver, methodImage: UIImage(imageLiteralResourceName: "pourover"))
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionViewCellLayout()
    self.collectionView.dataSource = self
    self.collectionView.delegate = self
    setupNib()
  }
  
  // MARK: - CollectionView Delegate Functions
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dummyData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MethodCollectionViewCell", for: indexPath) as! MethodCollectionViewCell
    cell.backgroundColor = UIColor.clear
    cell.setup(withImage: dummyData[indexPath.row].methodImage, andName: dummyData[indexPath.row].methodName.rawValue)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if indexPath.row == 1 {
      RecipeViewController.push(from: self, withMethodName: "methodNameOfCollectionViewCell") // <-- This should be the methodName of the BrewMethod on the chosen CollectionViewCell
    }
  }
  
  private func setupCollectionViewCellLayout() {
    let screenSize = UIScreen.main.bounds
    let screenWidth = screenSize.width
    let screenHeight = screenSize.height
    
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
    layout.itemSize = CGSize(width: screenWidth, height: screenHeight / 2)
    layout.minimumLineSpacing = 2
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .horizontal
    collectionView.collectionViewLayout = layout
    collectionView.decelerationRate = UIScrollViewDecelerationRateNormal
    collectionView.showsHorizontalScrollIndicator = true
    collectionView.bounces = true
    collectionView.isSpringLoaded = true
    collectionView.isPagingEnabled = true
  }
  
  // MARK: - Nib Registration
  private func setupNib() {
    //                                          *** REMEMBER TO REGISTER NIB IN FUTURE ***
    let nib = UINib(nibName: "MethodCollectionViewCell", bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: "MethodCollectionViewCell")
  }

}

