//
//  Meme.swift
//  BoredDogs
//
//  Created by Владимир Киселев on 08.04.2022.
//

import Foundation

struct Meme: Decodable {
    let success: Bool?
    let data: Data?
}

struct Data: Decodable {
    let memes: [SingleMeme]?
}

struct SingleMeme: Decodable {
    let id: String?
    let name: String?
    let url: String?
    let width: Int?
    let height: Int?
    let box_count: Int?
}
