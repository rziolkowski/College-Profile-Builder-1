//
//  ViewController.swift
//  College Profile Builder
//
//  Created by rziolkowski on 1/20/16.
//  Copyright © 2016 rziolkowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var colleges : [College] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        colleges.append(College(name: "University of Illinois", location: "Urbana/Champaigne", numberOfStudents: 40000, image: UIImage(named: "Default")!))
        colleges.append(College(name: "Valparaiso", location: "Valparaiso", numberOfStudents: 40000, image: UIImage(named: "Default")!))
        colleges.append(College(name: "Bradley", location: "Peoria", numberOfStudents: 40000, image: UIImage(named: "Default")!))
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = colleges[indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    @IBAction func onAddTapped(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add College Here"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) -> Void in
            let nameTextField = alert.textFields![0] as UITextField
            self.colleges.append(College(name: nameTextField.text!))
            self.tableView.reloadData()
        }
        alert.addAction(addAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func onEditTapped(sender: UIBarButtonItem) {
        
    }
}

