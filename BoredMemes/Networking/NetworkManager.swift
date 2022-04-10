//
//  NetworkManager.swift
//  BoredMemes
//
//  Created by Владимир Киселев on 10.04.2022.
//

import Foundation
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchMeme(from url: String?, with completion: @escaping(UIImage) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let meme = try JSONDecoder().decode(Meme.self, from: data)
                guard let firstMeme = meme.data?.memes?.randomElement()?.url else {return}
                guard let firstMemeUrl =  URL(string: firstMeme) else { return }

                URLSession.shared.dataTask(with: firstMemeUrl) { data, response, error in
                    guard let data = data, let _ = response else {
                        print(error?.localizedDescription ?? "No error description")
                        return
                    }

                    guard let image = UIImage(data: data) else { return }

                    DispatchQueue.main.async {
                        completion(image)
                    }
                }.resume()
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchActivity(from url: String?, with completion: @escaping(Activity) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let activity = try JSONDecoder().decode(Activity.self, from: data)
                DispatchQueue.main.async {
                    completion(activity)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
        
    }
}
