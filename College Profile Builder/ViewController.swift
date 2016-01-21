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
        colleges.append(College(name: "University of Illinois", location: "Urbana/Champaign", numberOfStudents: 40000, image: UIImage(named: "Default")!))
        colleges.append(College(name: "Valparaiso", location: "Valparaiso", numberOfStudents: 40000, image: UIImage(named: "Default")!))
        colleges.append(College(name: "Bradley", location: "Peoria", numberOfStudents: 40000, image: UIImage(named: "Default")!))
        
        editButton.tag = 0
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = "\(colleges[indexPath.row].name), \(colleges[indexPath.row].location)"
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.college = colleges[index!]
    }
    
    @IBAction func onAddTapped(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add College Name Here"
        }
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add College Location Here"
        }
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add College Population Here"
            textField.keyboardType = .NumberPad
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) -> Void in
            let nameTextField = alert.textFields![0] as UITextField
            let locationTextField = alert.textFields![1] as UITextField
            let populationTextField = alert.textFields![2] as UITextField
            self.colleges.append(College(name: nameTextField.text!, location: locationTextField.text!, numberOfStudents: Int(populationTextField.text!)!, image: UIImage(named: "Default")!))
            self.tableView.reloadData()
        }
        alert.addAction(addAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func onEditTapped(sender: UIBarButtonItem) {
        if sender.tag == 0
        {
            tableView.editing = true
            sender.tag = 1
        }
        else
        {
            tableView.editing = false
            sender.tag = 0
        }
    }
    
}

