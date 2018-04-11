//
//  ViewController.swift
//  POC-Tabmenu
//
//  Created by Thiago Diniz on 11/04/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit
import SwipeMenuViewController

class MenuViewController: UIViewController {

    @IBOutlet weak var swipeMenuView: SwipeMenuView!
    
    var options = SwipeMenuViewOptions()
    
    var tabs = ["Filmes (46)","Programas de TV / Séries (5)","Filmes para alugar (23)"]
    var controllers: [ResultViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeMenuView.dataSource = self
        swipeMenuView.delegate = self
        
        let options: SwipeMenuViewOptions = .init()
        
        let controller1 = StoryboardScene.Main.resultViewController.instantiate()
        controller1.labelString = "1"
        controller1.view.frame = self.view.frame
        
        let controller2 = StoryboardScene.Main.resultViewController.instantiate()
        controller2.labelString = "2"
        controller2.view.frame = self.view.frame
        
        let controller3 = StoryboardScene.Main.resultViewController.instantiate()
        controller3.labelString = "3"
        controller3.view.frame = self.view.frame
        
        controllers.append(controller1)
        controllers.append(controller2)
        controllers.append(controller3)
        
        swipeMenuView.reloadData(options: options)
    }
}

extension MenuViewController: SwipeMenuViewDelegate {
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        print("mudou de \(fromIndex) para \(toIndex)")
    }
}

extension MenuViewController: SwipeMenuViewDataSource {
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        return controllers[index]
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return tabs[index]
    }
    
    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return tabs.count
    }
}
