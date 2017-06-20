//
//  SignupViewController.swift
//  SpotMe
//
//  Created by Dale Shin on 6/11/17.
//  Copyright © 2017 Dale Shin. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class SignupViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var nameField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var emailField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var passwordField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var phoneNumberField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    
    deinit {
        deregisterFromKeyboardNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap(gesture:)))
        self.view.addGestureRecognizer(tapGesture)
        
        self.view.backgroundColor = Constants.backgroundColor
        self.title = "Sign Up"
        self.nameField.delegate = self
        self.emailField.delegate = self
        self.passwordField.delegate = self
        self.phoneNumberField.delegate = self
        
        self.scrollView.addSubview(self.photoButton)
        self.scrollView.addSubview(self.nameField)
        self.scrollView.addSubview(self.emailField)
        self.scrollView.addSubview(self.passwordField)
        self.scrollView.addSubview(self.phoneNumberField)
        self.scrollView.addSubview(self.createButton)
        
        initTextFields()
        initButtons()
        setupConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.deregisterFromKeyboardNotifications()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func initTextFields() {
        self.nameField.translatesAutoresizingMaskIntoConstraints = false
        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.phoneNumberField.translatesAutoresizingMaskIntoConstraints = false
        
        self.nameField.placeholder = "Name"
        self.nameField.title = "Name"
        self.nameField.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightThin)
        self.nameField.lineColor = .white
        self.nameField.textColor = .white
        self.nameField.placeholderColor = .white
        self.nameField.selectedTitleColor = .white
        self.nameField.selectedLineColor = .white
        self.nameField.iconFont = UIFont.fontAwesome(ofSize: 16)
        self.nameField.iconText = String.fontAwesomeIcon(name: .user)
        self.nameField.autocorrectionType = .no
        self.nameField.returnKeyType = .next
        self.nameField.autocapitalizationType = .none
        self.nameField.selectedIconColor = Constants.overcastBlueColor
        self.nameField.iconMarginBottom = 2.0
        
        self.emailField.placeholder = "Email"
        self.emailField.title = "Email"
        self.emailField.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightThin)
        self.emailField.lineColor = .white
        self.emailField.textColor = .white
        self.emailField.placeholderColor = .white
        self.emailField.selectedTitleColor = .white
        self.emailField.selectedLineColor = .white
        self.emailField.iconFont = UIFont.fontAwesome(ofSize: 16)
        self.emailField.iconText = String.fontAwesomeIcon(name: .envelope)
        self.emailField.autocorrectionType = .no
        self.emailField.returnKeyType = .next
        self.emailField.autocapitalizationType = .none
        self.emailField.selectedIconColor = Constants.overcastBlueColor
        self.emailField.iconMarginBottom = 2.0
        
        self.passwordField.placeholder = "Password"
        self.passwordField.title = "Password"
        self.passwordField.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightThin)
        self.passwordField.lineColor = .white
        self.passwordField.textColor = .white
        self.passwordField.placeholderColor = .white
        self.passwordField.selectedTitleColor = .white
        self.passwordField.selectedLineColor = .white
        self.passwordField.isSecureTextEntry = true
        self.passwordField.iconFont = UIFont.fontAwesome(ofSize: 16)
        self.passwordField.iconText = String.fontAwesomeIcon(name: .lock)
        self.passwordField.selectedIconColor = Constants.overcastBlueColor
        self.passwordField.iconMarginBottom = 2.0
        
        self.phoneNumberField.placeholder = "Phone"
        self.phoneNumberField.title = "Phone"
        self.phoneNumberField.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightThin)
        self.phoneNumberField.lineColor = .white
        self.phoneNumberField.textColor = .white
        self.phoneNumberField.placeholderColor = .white
        self.phoneNumberField.selectedTitleColor = .white
        self.phoneNumberField.selectedLineColor = .white
        self.phoneNumberField.iconFont = UIFont.fontAwesome(ofSize: 16)
        self.phoneNumberField.iconText = String.fontAwesomeIcon(name: .phone)
        self.phoneNumberField.selectedIconColor = Constants.overcastBlueColor
        self.phoneNumberField.iconMarginBottom = 2.0
        
        self.registerForKeyboardNotifications()
    }
    
    private func initButtons() {
        self.createButton.translatesAutoresizingMaskIntoConstraints = false
        self.photoButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.createButton.setTitle("Create", for: .normal)
        self.createButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightThin)
        self.createButton.setTitleColor(.white, for: .normal)
        self.createButton.backgroundColor = Constants.overcastBlueColor
        self.createButton.addTarget(self, action: #selector(create(sender:)), for: .touchUpInside)
        self.createButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.photoButton.frame = CGRect()
        self.photoButton.backgroundColor = .red
        self.photoButton.layer.cornerRadius = (UIScreen.main.bounds.height*0.175) / 2
        self.photoButton.layer.masksToBounds = true
        self.photoButton.addTarget(self, action: #selector(takePhoto(sender:)), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        self.photoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        self.photoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.photoButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height*0.175).isActive = true
        self.photoButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height*0.175).isActive = true
        
        self.nameField.topAnchor.constraint(equalTo: self.photoButton.bottomAnchor, constant: 40).isActive = true
        self.nameField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.nameField.bottomAnchor.constraint(equalTo: self.emailField.topAnchor, constant: -20).isActive = true
        self.nameField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.textFieldFullMargin).isActive = true
        
        self.emailField.topAnchor.constraint(equalTo: self.nameField.bottomAnchor, constant: 20).isActive = true
        self.emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.emailField.bottomAnchor.constraint(equalTo: self.passwordField.topAnchor, constant: -20).isActive = true
        self.emailField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.textFieldFullMargin).isActive = true
        
        self.passwordField.topAnchor.constraint(equalTo: self.emailField.bottomAnchor, constant: 20).isActive = true
        self.passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.passwordField.bottomAnchor.constraint(equalTo: self.phoneNumberField.topAnchor, constant: -20).isActive = true
        self.passwordField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.textFieldFullMargin).isActive = true
        
        self.phoneNumberField.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 20).isActive = true
        self.phoneNumberField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.phoneNumberField.bottomAnchor.constraint(equalTo: self.createButton.topAnchor, constant: -60).isActive = true
        self.phoneNumberField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.phoneNumberField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.textFieldFullMargin).isActive = true
        
        self.createButton.topAnchor.constraint(equalTo: self.phoneNumberField.bottomAnchor, constant: 60).isActive = true
        self.createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.createButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.textFieldFullMargin).isActive = true
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(sender:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(sender:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    func deregisterFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    func keyboardWillShow(sender: NSNotification) {
        var info = sender.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        
        self.scrollView.contentOffset = CGPoint(x: 0, y: keyboardSize!.height/2)
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.scrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    func create(sender: UIButton) {
        print("create pressed")
    }

    func tap(gesture: UIGestureRecognizer) {
        self.scrollView.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
