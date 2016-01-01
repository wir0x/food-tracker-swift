//
//  ViewController.swift
//  FoodTracker
//
//  Created by Gonzalo Salazar Velasquez on 11/28/15.
//  Copyright © 2015 Gonzalo Salazar Velasquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,
UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RaitingControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text fiel's user input through delegate callbacks.
        nameTextField.delegate = self
    }
    
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyword.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
    }

    
    
    // MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        // Hide the keyboard
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controll that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photo to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make suer ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The infor dictionary contains multiple representation of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
