//
//  ViewController.swift
//  MealCreator
//
//  Created by marek on 29.04.2019.
//  Copyright © 2019 Marek Garczewski. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ChameleonFramework
class ViewController: UIViewController {

    @IBOutlet weak var ingredientsTextField: UITextField!
    
    let url = "https://www.food2fork.com/api/search?key=a6e6ba4a3f4134c3c50a00bdfb9e0ddd&q="
    var arrayOfRecipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        
        let text = ingredientsTextField.text!
        if text != "" && text != "Your ingredients" {
            getData(withIngredients: text)
        }
        else {
            ingredientsTextField.text = "Your ingredients"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToSwipe" {
            
            let destinationVC = segue.destination as! SwipeViewController
            destinationVC.arrayForSwipe = arrayOfRecipes
            
        }
    }
    
    func getData(withIngredients: String) {
        Alamofire.request(url+withIngredients, method: .get).responseJSON {
            response in
            if response.result.isSuccess {
                let data : JSON = JSON(response.data!)
                for i in 0..<20 {
                    let newRecipe = Recipe()
                    newRecipe.image_url = data["recipes"][i]["image_url"].description
                    newRecipe.source_url = data["recipes"][i]["source_url"].description
                    newRecipe.title = data["recipes"][i]["title"].description
                    self.arrayOfRecipes.append(newRecipe)
                }
                self.performSegue(withIdentifier: "goToSwipe", sender: self)
            }
            else {
                print(response.error!)
                self.ingredientsTextField.text = "Your ingredients?"
            }
            
        }
    }

}

