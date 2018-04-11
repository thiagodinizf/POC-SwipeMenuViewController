//
//  ViewController.swift
//  POC-Tabmenu
//
//  Created by Thiago Diniz on 11/04/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit
import SwipeMenuViewController

struct TabModel {
    let id: Int
    let title: String
}

class MenuViewController: UIViewController {

    @IBOutlet weak var swipeMenuView: SwipeMenuView!
    
    var options: SwipeMenuViewOptions = .init()
    
    var tabs = [TabModel(id: 30031, title: "Filmes (46)"),
                TabModel(id: 30032, title: "Programas de TV / Séries (5)"),
                TabModel(id: 30033, title: "Filmes para alugar (23)")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        swipeMenuView.dataSource = self
        swipeMenuView.delegate = self
        
        options.tabView.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 26/255, alpha: 1.0)
        options.tabView.height = 50
        options.tabView.underlineView.backgroundColor = UIColor(red: 68/255, green: 165/255, blue: 235/255, alpha: 1.0)
        options.tabView.itemView.textColor = .lightGray
        options.tabView.itemView.selectedTextColor = .white
        
        swipeMenuView.reloadData(options: options)
    }
}

extension MenuViewController: SwipeMenuViewDelegate {
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        swipeMenuView.reloadData(options: options, default: toIndex, isOrientationChange: false)
    }
}

extension MenuViewController: SwipeMenuViewDataSource {
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        let controller = StoryboardScene.Main.resultViewController.instantiate()
        controller.filter = tabs[index].id
        return controller
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return tabs[index].title
    }
    
    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return tabs.count
    }
}
