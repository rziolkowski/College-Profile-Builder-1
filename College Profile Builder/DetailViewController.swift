//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by rziolkowski on 1/21/16.
//  Copyright © 2016 rziolkowski. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var populationTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!

    var college : College!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = college.name
        locationTextField.text = college.location
        populationTextField.text = String(college.numberOfStudents)
        imageView.image = college.image
    }
    @IBAction func onTappedSaveButton(sender: AnyObject) {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.numberOfStudents = Int(populationTextField.text!)!
        nameTextField.resignFirstResponder()
        locationTextField.resignFirstResponder()
        populationTextField.resignFirstResponder()
    }
}
