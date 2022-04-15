//
//  BreweryCell.swift
//  BoredMemes
//
//  Created by Владимир Киселев on 15.04.2022.
//

import Foundation
import UIKit

class BreweryCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    
    @IBOutlet var address: UILabel!
    
    func configure(with brewery: Brewery) {
        name.text = brewery.name
        address.text = brewery.state
//        breweryImage.text = brewery.name
//        breweryNameLabel.text = "\(brewery.name ?? "")"
//        numberOfTests.text = "Number of tests: \(course.numberOfTests ?? 0)"
//        NetworkManager.shared.fetchImage(from: brewery.imageUrl) { result in
//            switch result {
//            case .success(let imageData):
//                self.courseImage.image = UIImage(data: imageData)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
}
