//
//  ResultViewController.swift
//  POC-Tabmenu
//
//  Created by Thiago Diniz on 11/04/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var filter: Int = 0
    var codes:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        reloadData()
    }
    
    func reloadData() {
        codes.append(filter)
        tableView.reloadData()
        print(filter)
    }
}

extension ResultViewController: UITableViewDelegate {
    
}

extension ResultViewController: UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return codes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(codes[indexPath.row])
        return cell
    }
    
}
