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
    @IBOutlet var city: UILabel!
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var additional: UILabel!
    
    func configure(with brewery: Brewery) {
        name.text = brewery.name
        address.text = brewery.state
        city.text = brewery.city
        additional.text = brewery.breweryType
    }
    
}
