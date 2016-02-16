//
//  MapViewController.swift
//  College Profile Builder
//
//  Created by rziolkowski on 2/16/16.
//  Copyright © 2016 rziolkowski. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapTextField: UITextField!
    var firstText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        mapTextField.delegate = self
        mapTextField.text = firstText
        findLocation(mapTextField.text!)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        findLocation(textField.text!)
        textField.resignFirstResponder()
        return true
    }
    
    func displayMap(placemark: CLPlacemark)
    {
        mapTextField.text = placemark.name
        let center = CLLocationCoordinate2DMake((placemark.location?.coordinate.latitude)!,
            (placemark.location?.coordinate.longitude)!)
        let span = MKCoordinateSpanMake(1.0, 1.0)
        let region = MKCoordinateRegionMake(center, span)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = mapTextField.text!
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
    }
    
    func findLocation(locationName: String)
    {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationName) { (placemarks, error) -> Void in
            if error != nil
            {
                print(error)
            }
            else
            {
                if placemarks!.count > 1
                {
                    let alert = UIAlertController(title: "Select a Location", message: nil, preferredStyle:
                        .ActionSheet)
                    for placemark in placemarks!
                    {
                        let locationAction = UIAlertAction(title: placemark.name!, style: .Default, handler: { (action) -> Void in
                            self.displayMap(placemark)
                        })
                        alert.addAction(locationAction)
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                    alert.addAction(cancelAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                else if placemarks!.count == 1
                {
                    let placemark = placemarks!.first as CLPlacemark!
                    self.displayMap(placemark)
                }
            }
        }
    }
}
