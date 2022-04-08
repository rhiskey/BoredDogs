//
//  ActivityCell.swift
//  BoredDogs
//
//  Created by Владимир Киселев on 08.04.2022.
//

import UIKit

class ActivityCell: UITableViewCell {
    @IBOutlet var dogImage: UIImageView!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var participantsLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var linkLabel: UILabel!
    @IBOutlet var accessibilityLB: UILabel!
    
    func configure(with activity: Activity, and dog: Dog) {
        typeLabel.text = activity.activity
        participantsLabel.text = "Number of participants: \(activity.participants ?? 0)"
        priceLabel.text = "Price: \(activity.price ?? 0)"
        DispatchQueue.global().async {
            guard let url = URL(string: dog.message ?? "") else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.dogImage.image = UIImage(data: imageData)
            }
        }
    }
}
