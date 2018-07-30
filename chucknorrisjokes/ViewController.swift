//
//  ViewController.swift
//  chucknorrisjokes
//
//  Created by Chris Cook on 7/30/18.
//  Copyright © 2018 destinycreates. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var factLabel: UILabel!
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    let requestURL = "https://api.chucknorris.io/jokes/random"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func factButtonTapped(_ sender: Any) {
        activityIndicator.startAnimating()
        Alamofire.request(requestURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            self.activityIndicator.stopAnimating()
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.factLabel.text = json["value"].stringValue
            case .failure(let error):
                print(error)
                self.factLabel.text = "An error occured. Please try again."
            }
        }
    }
    
    
}

