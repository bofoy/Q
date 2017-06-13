//
//  LoginViewControllerExtension.swift
//  SpotMe
//
//  Created by Dale Shin on 6/12/17.
//  Copyright © 2017 Dale Shin. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(emailField) {
            emailField.resignFirstResponder()
            passwordField.becomeFirstResponder()
        }
        else {
            passwordField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
}
