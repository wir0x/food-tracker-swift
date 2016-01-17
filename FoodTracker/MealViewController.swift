//
//  ViewController.swift
//  FoodTracker
//
//  Created by Gonzalo Salazar Velasquez on 11/28/15.
//  Copyright © 2015 Gonzalo Salazar Velasquez. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate,
UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RaitingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    /*
    This value is either passed by 'MelaTableViewController' in prepareForSegue(_:sender)'
    or constructed as part of adding a new meal.
    */
    var meal: Meal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text fiel's user input through delegate callbacks.
        nameTextField.delegate = self
        
        // Set up views if editing an existing Meal.
        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
        }
        
        // Enable the save button only if the text field has a valid Meal name.
        checkValidMealName()
    }
    
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyword.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing
        saveButton.enabled = false
    }
    
    func checkValidMealName() {
        // Disable the Save button if the text is empty
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidMealName()
        navigationItem.title = textField.text
    }

    // MARK: Navigation
    @IBAction func cancel(sender: AnyObject) {
        // Depending on style of presentation (modal or push presentation, this view controll needs to be dismissed in two different ways.
        let isPresentingIndAddMealMode = presentingViewController is UINavigationController
        if isPresentingIndAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true)
        }

        
    }
    
    // This method lets you configre a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            // Set the meal to e passed to MealTableViewController after the unwind segue.
            meal = Meal(name: name, photo: photo, rating: rating)
            
        }
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

