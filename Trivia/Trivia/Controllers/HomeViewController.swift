//
//  HomeViewController.swift
//  Trivia
//
//  Created by Adaikalraj on 05/03/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var nameField: UITextField! //To get user name.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        
        //keyboard observer to move a view up when textfield is edited.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //function for keyboard appearing action
    @objc func keyboardWillShow(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 120
            }
        }
    }
    
    //function for keyboard disappearing action
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    //next button action
    @IBAction func nextButtonAction(_ sender: UIButton) {
        
        if nameField.text == ""{ //if textfield has no value alert is shown.
            let alert = UIAlertController(title: "Information", message: "Please Enter Your Name!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{ //if textfield has some value, we move to the next viewcontroller also passing data.
            nameField.resignFirstResponder()
            let nextViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CricketQuestionViewController") as? CricketQuestionViewController
            nextViewController!.name = nameField.text!
            self.navigationController?.pushViewController(nextViewController!, animated: true)
        }
        
    }
    
    //textfield delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
    }
}
