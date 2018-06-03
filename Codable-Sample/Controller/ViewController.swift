//
//  ViewController.swift
//  Codable-Sample
//
//  Created by kawaharadai on 2018/06/03.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let provider = TableViewProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    private func setup() {
        self.tableView.delegate = self
        self.tableView.dataSource = self.provider
        self.provider.setList(listData: ["通常スタートJSON", "配列スタートJSON"])
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("通常スタートJSONのマッピング")
        case 1:
            print("配列スタートJSONのマッピング")
        default:
            return
        }
    }
}

