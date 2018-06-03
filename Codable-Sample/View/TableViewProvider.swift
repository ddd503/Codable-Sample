//
//  TableViewProvider.swift
//  Codable-Sample
//
//  Created by kawaharadai on 2018/06/03.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

final class TableViewProvider: NSObject {
    private var list = [String]()
    
    func setList(listData: [String]) {
        self.list = listData
    }
}

extension TableViewProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = self.list[indexPath.row]
        
        return cell
    }
}
