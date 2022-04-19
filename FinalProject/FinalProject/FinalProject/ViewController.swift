//
//  ViewController.swift
//  FinalProject
//
//  Created by FSE394 on 4/13/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logInPressed(_ sender: Any) {
        performSegue(withIdentifier: "LogIn", sender: nil)
    }
    
}

