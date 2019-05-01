//
//  SwipeViewController.swift
//  MealCreator
//
//  Created by marek on 30.04.2019.
//  Copyright © 2019 Marek Garczewski. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import ChameleonFramework
class SwipeViewController: UIViewController {

    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK:- Variables
    var arrayForSwipe = [Recipe]()
    var index: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageLabel.text = arrayForSwipe[0].source_url
        titleLabel.text = arrayForSwipe[0].title
        
        
        //MARK:- Gestures
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onClicLabel(sender:)))
        pageLabel.isUserInteractionEnabled = true
        pageLabel.addGestureRecognizer(tap)
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.onSwipeView(sender:)))
        swipe.direction = .left
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(swipe)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.backgroundColor = UIColor.flatWhiteColorDark()
        view.backgroundColor = UIColor(gradientStyle: .topToBottom, withFrame: view.frame, andColors: [UIColor.flatSandColorDark(), UIColor.flatYellow()])
        imageView.image = UIImage(named: "image")
    }
    
    
    
    //MARK: Swipe functions
    @objc func onSwipeView(sender: UISwipeGestureRecognizer) {
        
        index += 1
        if index == 20 {
            index = 0
        }
        titleLabel.text = arrayForSwipe[index].title
        pageLabel.text = arrayForSwipe[index].source_url
        
    }
    //MARK:- Page loading
    @objc func onClicLabel(sender: UITapGestureRecognizer) {
        
        openUrl(urlString: pageLabel.text)
    }
    
    
    func openUrl(urlString:String!) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }


}

