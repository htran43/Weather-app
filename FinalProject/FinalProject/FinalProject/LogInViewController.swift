//
//  LogInViewController.swift
//  FinalProject
//
//  Created by FSE394 on 4/13/22.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInPressed(_ sender: Any) {
        performSegue(withIdentifier: "LoggedIn", sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        performSegue(withIdentifier: "SignUp", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
