//
//  ResourcesViewController.swift
//  FinalProject
//
//  Created by FSE394 on 4/13/22.
//

import UIKit

class ResourcesViewController: UIViewController {
    @IBOutlet var floodButton: UIButton!
    @IBOutlet var hurricaneButton: UIButton!
    @IBOutlet var earthquakeButton: UIButton!
    @IBOutlet var wildfireButton: UIButton!
    @IBOutlet var snowstormButton: UIButton!
    @IBOutlet var tornadoButton: UIButton!
    @IBOutlet var thunderstormButton: UIButton!
    @IBOutlet var dustStormButton: UIButton!
    
    var resourceType: ResourceType = .flood
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func resourceButtonPressed(_ sender: UIButton) {
        switch sender {
        case floodButton:
            resourceType = .flood
        case hurricaneButton:
            resourceType = .hurricane
        case earthquakeButton:
            resourceType = .earthquake
        case wildfireButton:
            resourceType = .wildfire
        case snowstormButton:
            resourceType = .snowstorm
        case tornadoButton:
            resourceType = .tornado
        case thunderstormButton:
            resourceType = .thunderstorm
        case dustStormButton:
            resourceType = .duststorm
        default:
            break
        }
        performSegue(withIdentifier: "ShowResources", sender: sender)
    }
    
    @IBSegueAction func showResource(_ coder: NSCoder) -> OneResourceViewController? {
        return OneResourceViewController(coder: coder, resourceType: resourceType)
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
