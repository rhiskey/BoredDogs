//
//  Brewery.swift
//  BoredMemes
//
//  Created by Владимир Киселев on 15.04.2022.
//

import Foundation

struct Brewery: Codable{
    let id: String?
    let name: String?
    let breweryType: String?
    let street: String?
    let address2: String?
    let address3: String?
    let city: String?
    let state: String?
    let countyProvince: String?
    let postalCode: String?
    let country: String?
    let longitude: String?
    let latitude: String?
    let websiteUrl: String?
    let updatedAt: String?
    let createdAt: String?
    

    init(data: [String: Any]) {
        id = data["id"] as? String
        name = data["name"] as? String
        breweryType = data["brewery_type"] as? String
        street = data["street"] as? String
        address2 = data["address_2"] as? String
        address3 = data["address_3"] as? String
        city = data["city"] as? String
        state = data["state"] as? String
        countyProvince = data["county_province"] as? String
        postalCode = data["postal_code"] as? String
        country = data["country"] as? String
        longitude = data["longitude"] as? String
        latitude = data["latitude"] as? String
        websiteUrl = data["website_url"] as? String
        updatedAt = data["updated_at"] as? String
        createdAt = data["created_at"] as? String
        
    }
    
    static func getBreweries(from value: Any) -> [Brewery] {
        guard let breweryData = value as? [[String: Any]] else { return [] }
        return breweryData.compactMap { Brewery(data: $0) }
    }
}
