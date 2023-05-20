//
//  APIService.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/05/21.
//

import Foundation
import UIKit
import Moya

enum APIService {
    case createUser(request: [String: String])
    case mint(request: [String: String])
    case event(request: [String: Any])
}

extension APIService: TargetType {
    var baseURL: URL {
        let urlString = "https://229e-121-142-8-66.jp.ngrok.io"
        guard let url = URL(string: urlString) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .createUser:
            return "/createUser"
        case .mint:
            return "/mint"
        case .event:
            return "/event"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createUser:
            return .post
        case .mint:
            return .post
        case .event:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .createUser(request: let data):
            return .requestParameters(parameters: data.toDictionary(), encoding: JSONEncoding.default)
        case .mint(request: let data):
            return .requestParameters(parameters: data.toDictionary(), encoding: JSONEncoding.default)
        case .event(request: let data):
            return .requestParameters(parameters: data, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
