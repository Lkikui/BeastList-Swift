//
//  ViewController.swift
//  BeastList
//
//  Created by Lisa Ryland on 1/12/18.
//  Copyright © 2018 Lisa Ryland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Create this array at the top of your class as a property
    var tasks = ["Exercise for 30 minutes", "Wireframe for some project", "Do laundry"]

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        // Add the textField text as an item to the array
        if !(taskTextField.text?.isEmpty)! {
            tasks.append(taskTextField.text!)
            print(tasks)
        }
        
        // reload the table view data
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    // how many cells are we going to need?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    // how should I create each cell?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        // set text label to the model that is corresponding to the row in array
        cell.textLabel?.text = tasks[indexPath.row]
        
        // return cell so that Table View knows what to render in each row
        return cell
    }

}

