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
        self.id = data["id"] as? String
        self.name = data["name"] as? String
        self.breweryType = data["brewery_type"] as? String
        self.street = data["street"] as? String
        self.address2 = data["address_2"] as? String
        self.address3 = data["address_3"] as? String
        self.city = data["city"] as? String
        self.state = data["state"] as? String
        self.countyProvince = data["county_province"] as? String
        self.postalCode = data["postal_code"] as? String
        self.country = data["country"] as? String
        self.longitude = data["longitude"] as? String
        self.latitude = data["latitude"] as? String
        self.websiteUrl = data["website_url"] as? String
        self.updatedAt = data["updated_at"] as? String
        self.createdAt = data["created_at"] as? String
        
    }
    
    static func getBreweries(from value: Any) -> [Brewery] {
        guard let breweryData = value as? [[String: Any]] else { return [] }
        return breweryData.compactMap { Brewery(data: $0) }
    }
}
