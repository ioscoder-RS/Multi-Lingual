//
//  ViewController.swift
//  MultiLingualProject
//
//  Created by raskin-sa on 31/03/2020.
//  Copyright © 2020 raskin-sa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var nextScreenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupUI()
    }

    func setupUI(){
        let buttonTitle = NSLocalizedString("login", comment: "the title of the login button ")
        nextScreenButton.setTitle(buttonTitle, for: .normal)
        
        let passwordPlaceHolder = NSLocalizedString("input password..", comment: "the password placeholder text")
        passwordField.placeholder = passwordPlaceHolder
        
        let topLabelText = NSLocalizedString("Authorisation", comment: "the text of the top label")
        topLabel.text = topLabelText
    }
    
    /// Do or not the segue depends on filling mandatory fields
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
       return checkLogin()
     }
    
    func checkLogin()-> Bool {
        guard let loginInput = loginField.text, let passwordInput = passwordField.text else {return false}
        
        if (loginInput.isEmpty)||(passwordInput.isEmpty) {
            let errorMessageBoxTitle = NSLocalizedString("Error", comment: "the title of the error messageBox")
            let errorMessageBoxText = NSLocalizedString("login or password did not entered", comment: "the text of the error messageBox")
            showLoginError(title: errorMessageBoxTitle, messagetext: errorMessageBoxText)
            return false
        } else{
            return true
        }
    }//func
    
    /// Raises error message if login or password didn't entered
    /// - Parameters:
    ///   - title: messageBox title
    ///   - messagetext: messageBox text
    func showLoginError(title: String, messagetext: String){
        
        
        // creating our messageBox, type of ".alert"
        let alert = UIAlertController(title: title, message: messagetext, preferredStyle: .alert)
        
        // creating action for button "ok" in our messagebox
        let action = UIAlertAction(title: "OK", style: .cancel,
                                   handler: { _ in
                                    //positioning to the login field
                                    self.loginField.becomeFirstResponder()
        })
        
        // adding our action to our messagebox
        alert.addAction(action)
        
        // show our message box
        present(alert, animated: true, completion: nil)
    }
}

