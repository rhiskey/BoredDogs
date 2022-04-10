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
    
    private var activity: Activity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.startAnimating()
        loadingIndicator.hidesWhenStopped = true
        
        fetchMeme()
        fetchActivity()
    }
    
    private func fetchMeme() {
        guard let url = URL(string: Link.memeApi.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let meme = try JSONDecoder().decode(Meme.self, from: data)
                print(meme)
                guard let firstMeme = meme.data?.memes?.randomElement()?.url else {return}
                guard let firstMemeUrl =  URL(string: firstMeme) else { return }
                
                URLSession.shared.dataTask(with: firstMemeUrl) { data, response, error in
                    guard let data = data, let response = response else {
                        print(error?.localizedDescription ?? "No error description")
                        return
                    }
                    
                    print(response)
                    
                    guard let image = UIImage(data: data) else { return }
                    
                    DispatchQueue.main.async {
                        self.imageView.image = image
                        self.imageView.sizeToFit()
                        self.loadingIndicator.stopAnimating()
                    }
                }.resume()
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    private func fetchActivity() {
        guard let url = URL(string: Link.boredApi.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let activity = try JSONDecoder().decode(Activity.self, from: data)
                DispatchQueue.main.async {
                    self.activityLB.text =
                    """
                    Activity: \(activity.activity ?? "")
                    Price: \(activity.price ?? 0)
                    Participants: \(activity.participants ?? 0)
                    Accessibility: \(activity.accessibility ?? 0)
                    """
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }

}
