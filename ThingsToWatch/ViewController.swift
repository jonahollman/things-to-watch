//
//  ViewController.swift
//  ThingsToWatch
//
//  Created by Jonah Ollman on 8/15/17.
//  Copyright © 2017 Jonah Ollman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    
    var thingsToWatch: [ThingToWatch] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thingsToWatch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListTableViewCell
        
        let thingToWatch = thingsToWatch[indexPath.row]
        
        cell.titleLabel.text = thingToWatch.title
        cell.typeLabel.text = thingToWatch.type
        
        if thingToWatch.type == "Movie" {
            cell.typeLabel.backgroundColor = UIColor.blue
        } else {
            cell.typeLabel.backgroundColor = UIColor.orange
        }
        
        if thingToWatch.location == "Netflix" {
            cell.locationImage.image = UIImage(named: "netflix")
        } else if thingToWatch.location == "HBOGo" {
            cell.locationImage.image = UIImage(named: "hbogo")
        } else if thingToWatch.location == "iTunes" {
            cell.locationImage.image = UIImage(named: "itunes")
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            let thingToWatch = thingsToWatch[indexPath.row]
            context.delete(thingToWatch)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                thingsToWatch = try context.fetch(ThingToWatch.fetchRequest())
            }
            catch {
                print("Fetching failed")
            }
            
            tableView.reloadData()
            
        }
    }
    
    func getData() {
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            thingsToWatch = try context.fetch(ThingToWatch.fetchRequest())
        }
        catch {
            print("Fetching failed")
        }
    
    }

}

