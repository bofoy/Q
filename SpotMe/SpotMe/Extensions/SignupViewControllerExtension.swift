//
//  SignupViewControllerExtension.swift
//  SpotMe
//
//  Created by Dale Shin on 6/13/17.
//  Copyright © 2017 Dale Shin. All rights reserved.
//

import Foundation
import UIKit

extension SignupViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(nameField) {
            nameField.resignFirstResponder()
            emailField.becomeFirstResponder()
        }
        else if textField.isEqual(emailField) {
            emailField.resignFirstResponder()
            passwordField.becomeFirstResponder()
        }
        else if textField.isEqual(passwordField) {
            passwordField.resignFirstResponder()
            phoneNumberField.becomeFirstResponder()
        }
        else {
            phoneNumberField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.isEqual(self.nameField) {
            print("Email field")
            self.nameField.placeholder = "Enter full name"
        }
        
        textField.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
}

extension SignupViewController: UIImagePickerControllerDelegate {
    
    func takePhoto(sender: UIButton) {
        print("user button pressed")
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            imagePicker.cameraDevice = .front
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
}

extension SignupViewController: UINavigationControllerDelegate {
    
    
    
}

