//
//  DetailViewController.swift
//  College Table View
//
//  Created by dforsyth on 1/26/16.
//  Copyright © 2016 dforsyth. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var populationTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var webPageTextField: UITextField!
    let imagePicker = UIImagePickerController()
    var college: College!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        collegeTextField.text = college.name
        stateTextField.text = college.state
        populationTextField.text = String(college.population)
        imageView.image = college.image
        webPageTextField.text = college.webpage
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        }
    }
    
    @IBAction func onTappedSaveButton(sender: AnyObject) {
        college.name = collegeTextField.text!
        college.state = stateTextField.text!
        college.webpage = webPageTextField.text!
        college.population = Int(populationTextField.text!)!
        college.image = imageView.image!
    }
    
    @IBAction func goToWebSite(sender: AnyObject) {
        let url = NSURL(string: college.webpage)
        let svc = SFSafariViewController(URL: url!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }
    
    @IBAction func onCameraButtonTapped(sender: AnyObject)
    {
        if UIImagePickerController.isSourceTypeAvailable(.Camera)
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func onLibraryButtonTapped(sender: AnyObject) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
}