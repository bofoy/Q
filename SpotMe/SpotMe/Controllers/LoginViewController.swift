//
//  LoginViewController.swift
//  SpotMe
//
//  Created by Dale Shin on 6/9/17.
//  Copyright © 2017 Dale Shin. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import FontAwesome_swift

class LoginViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var learnMoreButton: UIButton!
    let forgotPasswordButton: UIButton! = UIButton(frame: CGRect())
    let emailField: SkyFloatingLabelTextFieldWithIcon! = SkyFloatingLabelTextFieldWithIcon(frame: CGRect())
    let passwordField: SkyFloatingLabelTextFieldWithIcon! = SkyFloatingLabelTextFieldWithIcon(frame: CGRect())
    
    deinit {
        self.deregisterFromKeyboardNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.backgroundColor = Constants.backgroundColor
        self.emailField.delegate = self
        self.passwordField.delegate = self
        
        self.scrollView.addSubview(self.loginButton)
        self.scrollView.addSubview(self.signupButton)
        self.scrollView.addSubview(self.forgotPasswordButton)
        self.scrollView.addSubview(self.learnMoreButton)
        self.scrollView.addSubview(self.emailField)
        self.scrollView.addSubview(self.passwordField)
        
        initButtons()
        initTextFields()
        setupConstraints()
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.deregisterFromKeyboardNotifications()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    private func initTextFields() {
        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        self.emailField.placeholder = "Email"
        self.emailField.title = "Email"
        self.emailField.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightThin)
        self.emailField.lineColor = .white
        self.emailField.textColor = .white
        self.emailField.placeholderColor = .white
        self.emailField.selectedTitleColor = .white
        self.emailField.selectedLineColor = .white
        self.emailField.iconFont = UIFont.fontAwesome(ofSize: 15)
        self.emailField.iconText = String.fontAwesomeIcon(name: .envelope)
        self.emailField.autocorrectionType = .no
        self.emailField.returnKeyType = .next
        self.emailField.autocapitalizationType = .none
        
        self.passwordField.placeholder = "Password"
        self.passwordField.title = "Password"
        self.passwordField.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightThin)
        self.passwordField.lineColor = .white
        self.passwordField.textColor = .white
        self.passwordField.placeholderColor = .white
        self.passwordField.selectedTitleColor = .white
        self.passwordField.selectedLineColor = .white
        self.passwordField.isSecureTextEntry = true
        self.passwordField.iconFont = UIFont.fontAwesome(ofSize: 15)
        self.passwordField.iconText = String.fontAwesomeIcon(name: .lock)
        
        self.registerForKeyboardNotifications()
    }
    
    private func initButtons() {
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.signupButton.translatesAutoresizingMaskIntoConstraints = false
        self.forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        self.learnMoreButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.loginButton.setTitle("Login", for: .normal)
        self.loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightThin)
        self.loginButton.setTitleColor(.white, for: .normal)
        self.loginButton.backgroundColor = Constants.overcastBlueColor
        self.loginButton.addTarget(self, action: #selector(login(sender:)), for: .touchUpInside)
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false;
        
        self.signupButton.setTitle("Sign Up", for: .normal)
        self.signupButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightThin)
        self.signupButton.setTitleColor(.white, for: .normal)
        self.signupButton.backgroundColor = Constants.overcastBlueColor
        self.signupButton.addTarget(self, action: #selector(signup(sender:)), for: .touchUpInside)
        self.signupButton.translatesAutoresizingMaskIntoConstraints = false;
        
        self.forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        self.forgotPasswordButton.setTitleColor(.white, for: .normal)
        self.forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightThin)
        self.forgotPasswordButton.backgroundColor = Constants.backgroundColor
        self.forgotPasswordButton.addTarget(self, action: #selector(forgotPassword(sender:)), for: .touchUpInside)
        self.forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false;
        
        self.learnMoreButton.setTitle("Learn more", for: .normal)
        self.learnMoreButton.setTitleColor(.white, for: .normal)
        self.learnMoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightThin)
        self.learnMoreButton.backgroundColor = Constants.backgroundColor
        self.learnMoreButton.addTarget(self, action: #selector(learnMore(sender:)), for: .touchUpInside)
        self.learnMoreButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        self.emailField.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: UIScreen.main.bounds.height*0.4).isActive = true
        self.emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.emailField.bottomAnchor.constraint(equalTo: self.passwordField.topAnchor, constant: -10).isActive = true
        self.emailField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width*0.2).isActive = true
        
        self.passwordField.topAnchor.constraint(equalTo: self.emailField.bottomAnchor, constant: 10).isActive = true
        self.passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.passwordField.bottomAnchor.constraint(equalTo: self.loginButton.topAnchor, constant: -60).isActive = true
        self.passwordField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width*0.2).isActive = true
        
        self.loginButton.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 60).isActive = true
        self.loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.loginButton.bottomAnchor.constraint(equalTo: self.signupButton.topAnchor, constant: -20).isActive = true
        self.loginButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width*0.2).isActive = true
        
        self.signupButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 20).isActive = true
        self.signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.signupButton.bottomAnchor.constraint(equalTo: self.forgotPasswordButton.topAnchor, constant: -60).isActive = true
        self.signupButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.signupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width*0.2).isActive = true
        
        self.forgotPasswordButton.topAnchor.constraint(equalTo: self.signupButton.bottomAnchor, constant: 60).isActive = true
        self.forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.forgotPasswordButton.bottomAnchor.constraint(equalTo: self.learnMoreButton.topAnchor, constant: -20).isActive = true
        self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        self.forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width*0.2).isActive = true
        
        self.learnMoreButton.topAnchor.constraint(equalTo: self.forgotPasswordButton.bottomAnchor, constant: 20).isActive = true
        self.learnMoreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.learnMoreButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        self.learnMoreButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width*0.2).isActive = true
    }
    
    func keyboardWillShow(sender: NSNotification) {
        var info = sender.userInfo!
        print(info)
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        
        self.scrollView.contentOffset = CGPoint(x: 0, y: keyboardSize!.height/2)
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.scrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    func login(sender: UIButton) {
        print("login button pressed")
    }
    
    func signup(sender: UIButton) {
        print("sign up button pressed")
    }
    
    func forgotPassword(sender: UIButton) {
        print("forgot password button pressed")
    }
    
    func learnMore(sender: UIButton) {
        print("learn more pressed")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
