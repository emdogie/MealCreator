//
//  SwipeViewController.swift
//  MealCreator
//
//  Created by marek on 30.04.2019.
//  Copyright © 2019 Marek Garczewski. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {

    var arrayForSwipe = [Recipe]()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(arrayForSwipe)
    }



}
