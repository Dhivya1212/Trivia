//
//  FlagQuestionViewController.swift
//  Trivia
//
//  Created by Adaikalraj on 06/03/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class FlagQuestionViewController: UIViewController {
    
    @IBOutlet weak var checkOneImageView: UIImageView!
    @IBOutlet weak var checkTwoImageView: UIImageView!
    @IBOutlet weak var checkThreeImageView: UIImageView!
    @IBOutlet weak var checkFourImageView: UIImageView!
    
    var getData: [String:Any]! = [String:Any]()    // for receiving the data from previous ViewController.
    var checkList: [Bool]!    // to store what are all the options selected.
    var answerArray: [String]! = [String]()    //to store the colors of the selected options.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initializing checkList array.
        checkList = [false,false,false,false]
    }
    
    //To move to the previous screen.
    @IBAction func previousButtonAction(_ sender: Any) {
        AppRouter.init().route(routeName: AppHelper.Route.previous.rawValue, fromContext: self, parameter: nil)
    }
    
    //Some actions are done before moving to the next view controller and then moves.
    @IBAction func nextButtonAction(_ sender: UIButton) {
        
        answerArray.removeAll()
        //if answers are selected,storing it in the array.
        if checkList.contains(true) {            
            if checkList[0] == true{
                answerArray.append("White")
            }
            if checkList[1] == true{
                answerArray.append("Yellow")
            }
            if checkList[2] == true{
                answerArray.append("Orange")
            }
            if checkList[3] == true{
                answerArray.append("Green")
            }
            //moving to the next viewcontroller with data.
            getData["flagColors"] = answerArray
            AppRouter.init().route(routeName: AppHelper.Route.summary.rawValue, fromContext: self, parameter: getData)
        }
            // shows alert if no answer is selected.
        else{
            let alert = UIAlertController(title: "Information", message: "Please Select an Option!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func checkboxButtonAction(_ sender: UIButton) {
        
        //using button tag, handling the UI changes and storing the answer.
        if sender.tag == 0{
            
            if checkList[sender.tag] == false{
                checkOneImageView.image = UIImage(named: "Checked")
                checkList[sender.tag] = true
            }else{
                checkOneImageView.image = UIImage(named: "Unchecked")
                checkList[sender.tag] = false
            }
            
        }else if sender.tag == 1{
            
            if checkList[sender.tag] == false{
                checkTwoImageView.image = UIImage(named: "Checked")
                checkList[sender.tag] = true
            }else{
                checkTwoImageView.image = UIImage(named: "Unchecked")
                checkList[sender.tag] = false
            }
            
        }else if sender.tag == 2{
            
            if checkList[sender.tag] == false{
                checkThreeImageView.image = UIImage(named: "Checked")
                checkList[sender.tag] = true
            }else{
                checkThreeImageView.image = UIImage(named: "Unchecked")
                checkList[sender.tag] = false
            }
            
        }else if sender.tag == 3{
            
            if checkList[sender.tag] == false{
                checkFourImageView.image = UIImage(named: "Checked")
                checkList[sender.tag] = true
            }else{
                checkFourImageView.image = UIImage(named: "Unchecked")
                checkList[sender.tag] = false
            }
            
        }
    }
    
    
}
