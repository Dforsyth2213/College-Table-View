//
//  MapViewController.swift
//  College Table View
//
//  Created by dforsyth on 2/25/16.
//  Copyright © 2016 dforsyth. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var textField: UITextField!
    var location = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        findLocation(location)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let locationName = textField.text!
        findLocation(locationName)
        return true
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
                    let alert = UIAlertController(title: "select a location", message: nil, preferredStyle: .ActionSheet)
                    for placemark in placemarks!{
                        let locationAction = UIAlertAction(title: placemark.name!, style: .Default, handler: { (action) -> Void in
                            self.displayMap(placemark)
                        })
                        alert.addAction(locationAction)
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                    alert.addAction(cancelAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                else if placemarks?.count == 1 {
                    let placemark = placemarks!.first as CLPlacemark!
                    self.displayMap(placemark)
                }
            }
        }
    }
    
    func displayMap(placemark: CLPlacemark)
    {
        textField.text = placemark.name
        let center = placemark.location!.coordinate
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(center, span)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = placemark.name
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
        textField.text = location
}

}




