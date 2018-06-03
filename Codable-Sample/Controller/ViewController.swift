//
//  ViewController.swift
//  Codable-Sample
//
//  Created by kawaharadai on 2018/06/03.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

enum JsonType: Int {
    case normal
    case arrayStart
}

final class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let provider = TableViewProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
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
        case JsonType.normal.rawValue:
            guard let dataSource = DataSource.create1() else {
                fatalError("dataSource is nil")
            }
            let resultVC = ResultViewController.make(object: dataSource)
            self.navigationController?.pushViewController(resultVC, animated: true)
        case JsonType.arrayStart.rawValue:
            guard let dataSource = DataSource.create2() else {
                fatalError("dataSource is nil")
            }
            let resultVC = ResultViewController.make(object: dataSource[0])
            self.navigationController?.pushViewController(resultVC, animated: true)
        default:
            return
        }
        
    }
}

