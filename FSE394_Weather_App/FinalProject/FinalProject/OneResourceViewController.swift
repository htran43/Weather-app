//
//  OneResourceViewController.swift
//  FinalProject
//
//  Created by FSE394 on 5/4/22.
//

import UIKit

class OneResourceViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var resource: ResourceType
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResource()
    }
    
    func displayResource() {
        descriptionLabel.text = resource.description
        titleLabel.text = resource.title
    }
    
    init?(coder: NSCoder, resourceType: ResourceType) {
        resource = resourceType
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
