//
//  ResultViewController.swift
//  Codable-Sample
//
//  Created by kawaharadai on 2018/06/03.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backBornLabel: UILabel!
    @IBOutlet weak var githubURLLabel: UILabel!
    
    // MARK: - setup
    class func make(object: UserDataResponse) -> ResultViewController {
        guard let resultVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {
            fatalError("ResultViewController is nil")
        }

        if
            let userName = object.userData[0].userName,
            let backBorn = object.userData[0].backbone,
            let githubURL = object.userData[0].githubURL {
            
            DispatchQueue.main.async {
                resultVC.nameLabel.text = "ユーザー名：\(userName)"
                resultVC.backBornLabel.text = "出身地：\(backBorn)"
                resultVC.githubURLLabel.text = "github：\(githubURL)"
            }
        }
        
        return resultVC
    }

    class func make(object: UserDataResponseArray) -> ResultViewController {
        guard let resultVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {
            fatalError("ResultViewController is nil")
        }
        
        if
            let userName = object.userData?.userName,
            let backBorn = object.userData?.backbone,
            let githubURL = object.userData?.githubURL {
            
            DispatchQueue.main.async {
                resultVC.nameLabel.text = "ユーザー名：\(userName)"
                resultVC.backBornLabel.text = "出身地：\(backBorn)"
                resultVC.githubURLLabel.text = "github：\(githubURL)"
            }
        }
        
        return resultVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
