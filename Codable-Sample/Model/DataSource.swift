//
//  DataSource.swift
//  Codable-Sample
//
//  Created by kawaharadai on 2018/06/03.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

final class DataSource: NSObject {
    
    /// ローカルのjsonファイルからユーザーデータを取得してマッピングしてVCに返す
    private func create() -> UserDataResponse? {
        
        guard let filePath = Bundle.main.path(forResource: "UserData-Sample", ofType: "json") else {
            fatalError("json is not found in main Bundle.")
        }
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath))
            let decoder = JSONDecoder()
            let responseData = try decoder.decode(UserDataResponse.self, from: jsonData)
            
            return responseData
            
        } catch let error {
            print("error: \(error.localizedDescription)")
            return nil
        }
        
    }
    
    /// 配列スタートの場合
    private func create() -> [UserDataResponseArray]? {
        
        guard let filePath = Bundle.main.path(forResource: "UserData-Sample-Array", ofType: "json") else {
            fatalError("json is not found in main Bundle.")
        }
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath))
            let decoder = JSONDecoder()
            let responseData = try decoder.decode([UserDataResponseArray].self, from: jsonData)
            
            return responseData
            
        } catch let error {
            print("error: \(error.localizedDescription)")
            return nil
        }
        
    }
}
