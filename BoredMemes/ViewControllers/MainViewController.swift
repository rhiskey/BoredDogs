//
//  MainViewController.swift
//  BoredDogs
//
//  Created by Владимир Киселев on 07.04.2022.
//

import UIKit

enum Link: String {
    case boredApi = "https://www.boredapi.com/api/activity"
    case memeApi = "https://api.imgflip.com/get_memes"
}

enum UserAction: String, CaseIterable {
    case downloadDogImage = "Get Random Meme"
}


class MainViewController: UICollectionViewController {
    let userActions = UserAction.allCases

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell

        cell.userActionLabel.text = userActions[indexPath.item].rawValue

        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]

        switch userAction {
        case .downloadDogImage: performSegue(withIdentifier: "showMeme", sender: nil)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMeme" {
            guard let memesVC = segue.destination as? BoredMemesViewController else { return }
            memesVC.urlActivity = Link.boredApi.rawValue
            memesVC.urlMeme = Link.memeApi.rawValue
        }
    }
    
    // MARK: - Private Methods
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the results in the Debug area",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see error in the Debug area",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
}

// MARK: - Networking
extension MainViewController {
    
    private func exampleFourButtonPressed() {
        guard let url = URL(string: Link.boredApi.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let websiteDescription = try JSONDecoder().decode(Activity.self, from: data)
                print(websiteDescription)
                self.successAlert()
            } catch let error {
                self.failedAlert()
                print(error)
            }
            
        }.resume()
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
