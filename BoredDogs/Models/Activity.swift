//
//  Activity.swift
//  BoredDogs
//
//  Created by Владимир Киселев on 08.04.2022.
//

import Foundation

struct Activity: Decodable {
    let activity: String?
    let type: String?
    let participants: Int?
    let price: Int?
    let link: String?
    let key: String?
    let accessibility: Int?
}
