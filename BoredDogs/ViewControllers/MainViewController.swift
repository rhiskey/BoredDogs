//
//  MainViewController.swift
//  BoredDogs
//
//  Created by Владимир Киселев on 07.04.2022.
//

import UIKit

enum Link: String {
    case dogsApi = "https://dog.ceo/api/breeds/image/random"
    case boredApi = "https://www.boredapi.com/api/activity"
}

class MainViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
//
//        cell.userActionLabel.text = userActions[indexPath.item].rawValue
//
//        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let userAction = userActions[indexPath.item]
//
//        switch userAction {
//        case .downloadImage: performSegue(withIdentifier: "showImage", sender: nil)
//        case .exampleOne: exampleOneButtonPressed()
//        case .exampleTwo: exampleTwoButtonPressed()
//        case .exampleThree: exampleThreeButtonPressed()
//        case .exampleFour: exampleFourButtonPressed()
//        case .ourCourses: performSegue(withIdentifier: "showCourses", sender: nil)
//        }
    }
    

}

