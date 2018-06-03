//
//  UserData.swift
//  Codable-Sample
//
//  Created by kawaharadai on 2018/06/03.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

// 単体スタートの場合のモデル
struct UserDataResponse: Codable {
    
    var userCount: Int?
    let userData: [User]
    
    struct User: Codable {
        var userName: String?
        var backbone: String?
        var githubURL: String?
        
        private enum CodingKeys: String, CodingKey {
            case userName = "name"
            case backbone = "location"
            case githubURL = "url"
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case userData = "users"
    }
}

// 配列スタートの場合のモデル
struct UserDataResponseArray: Codable {
    
    var userCount: Int?
    let userData: User?
    
    struct User: Codable {
        var userName: String?
        var backbone: String?
        var githubURL: String?
        
        private enum CodingKeys: String, CodingKey {
            case userName = "name"
            case backbone = "location"
            case githubURL = "url"
        }
    }
}
