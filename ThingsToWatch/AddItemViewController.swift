//
//  AddItemViewController.swift
//  ThingsToWatch
//
//  Created by Jonah Ollman on 8/15/17.
//  Copyright © 2017 Jonah Ollman. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    
    @IBOutlet var locationSelector: UISegmentedControl!
    
    @IBOutlet var typeSelector: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToList(_ sender: Any) {
        
        if titleTextField.text != "" {
        
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let thingToWatch = ThingToWatch(context: context)
            
            thingToWatch.title = titleTextField.text!
            thingToWatch.location = locationSelector.titleForSegment(at: locationSelector.selectedSegmentIndex)
            thingToWatch.type = typeSelector.titleForSegment(at: typeSelector.selectedSegmentIndex)
            
            // Save data to CoreData
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            navigationController!.popViewController(animated: true)
            
        }
        
    }
    
    
}
