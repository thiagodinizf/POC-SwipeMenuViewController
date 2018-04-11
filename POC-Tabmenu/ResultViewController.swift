//
//  ResultViewController.swift
//  POC-Tabmenu
//
//  Created by Thiago Diniz on 11/04/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var labelController: UILabel!
    
    var labelString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        labelController.text = labelString
    }
}
