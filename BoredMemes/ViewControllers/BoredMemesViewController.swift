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
    
    private var activity: Activity?
    private var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.startAnimating()
        loadingIndicator.hidesWhenStopped = true
        
        NetworkManager.shared.fetchActivity(from: urlActivity) { activity in
            self.activity = activity
            
            self.activityLB.text =
            """
            Activity: \(activity.activity ?? "")
            Price: \(activity.price ?? 0)
            Participants: \(activity.participants ?? 0)
            Accessibility: \(activity.accessibility ?? 0)
            """
        }
        
        NetworkManager.shared.fetchMeme(from: urlMeme) { image in
            self.image = image
            self.imageView.image = image
            self.imageView.sizeToFit()
            self.loadingIndicator.stopAnimating()
        }
    }
}
