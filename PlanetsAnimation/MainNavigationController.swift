//
//  MainNavigationController.swift
//  PlanetsAnimation
//
//  Created by Евгения Шарамет on 17.05.2022.
//

import Foundation
import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        let mainScreen = MainScreenController()
        pushViewController(mainScreen, animated: true)
    }
}
