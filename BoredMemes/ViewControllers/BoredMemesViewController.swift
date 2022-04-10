//
//  BoredMemesViewController.swift
//  BoredDogs
//
//  Created by Владимир Киселев on 08.04.2022.
//

import UIKit

class BoredMemesViewController: UIViewController {
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityLB: UILabel!
    
    var urlActivity: String?
    var urlMeme: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.startAnimating()
        loadingIndicator.hidesWhenStopped = true
        
        NetworkManager.shared.fetchActivity(from: urlActivity) { result in
            
            switch result {
            case .success(let activity):
                self.activityLB.text =
                """
                Activity: \(activity.activity ?? "")
                Price: \(activity.price ?? 0)
                Participants: \(activity.participants ?? 0)
                Accessibility: \(activity.accessibility ?? 0)
                """
            case .failure(let error):
                print(error)
            }
            
        }
        
        NetworkManager.shared.fetchMeme(from: urlMeme) { image in
            self.imageView.image = image
            self.imageView.sizeToFit()
            self.loadingIndicator.stopAnimating()
        }
    }
}
