//
//  MapViewController.swift
//  College Profile Builder
//
//  Created by rziolkowski on 2/16/16.
//  Copyright © 2016 rziolkowski. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapTextField: UITextField!
    var firstText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        mapTextField.text = firstText
    }
}
