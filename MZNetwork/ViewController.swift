//
//  ViewController.swift
//  MZNetwork
//
//  Created by George on 2016/11/15.
//  Copyright © 2016年 George. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        MZNetworkManager<VIPApi>(.getSignInGift).sendRequest { (resultDict, status) in
            switch status{
            case .success:
                print("Succees!")
            case .failure:
                print("Failure!")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

