//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by rziolkowski on 1/21/16.
//  Copyright © 2016 rziolkowski. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var populationTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var webpageTextField: UITextField!

    var college : College!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = college.name
        locationTextField.text = college.location
        populationTextField.text = String(college.numberOfStudents)
        imageView.image = college.image
        webpageTextField.text = college.webpage
        imagePicker.delegate = self
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! MapViewController
        dvc.firstText = locationTextField.text!
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        }
    }
    
    @IBAction func onTappedSaveButton(sender: AnyObject) {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.numberOfStudents = Int(populationTextField.text!)!
        college.webpage = webpageTextField.text!
        college.image = imageView.image!
        nameTextField.resignFirstResponder()
        locationTextField.resignFirstResponder()
        populationTextField.resignFirstResponder()
        webpageTextField.resignFirstResponder()
    }
    
    @IBAction func onGoToTapped(sender: UIButton) {
        let svc = SFSafariViewController(URL: NSURL(string: webpageTextField.text!)!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }

    @IBAction func onLibraryTapped(sender: UIButton) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onCameraTapped(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera)
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
}
