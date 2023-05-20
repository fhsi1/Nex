//
//  EventResponse.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/21.
//

import Foundation

struct EventResponse: Codable {
//    let name, description: String?
    let externalURL: String
//    let image: String

    enum CodingKeys: String, CodingKey {
//        case name, description
        case externalURL = "external_url"
//        case image
    }
}
