//
//  CricketQuestionViewController.swift
//  Trivia
//
//  Created by Adaikalraj on 06/03/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class CricketQuestionViewController: UIViewController {
    
    @IBOutlet weak var optionOneView: UIView!
    @IBOutlet weak var optionTwoView: UIView!
    @IBOutlet weak var optionThreeView: UIView!
    @IBOutlet weak var optionFourView: UIView!
    @IBOutlet weak var OptionOneLabel: UILabel!
    
    @IBOutlet weak var optionThreeLabel: UILabel!
    @IBOutlet weak var optionTwoLabel: UILabel!
    @IBOutlet weak var optionFourLabel: UILabel!
    var optionSelected: Bool! //to check if any option is choosen or not.
    var name:String! // for storing the previous viewcontrollers data.
    var cricketerSelected:String! // for storing the current viewcontrollers answer.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionSelected = false //initially setting option selected to false.
        
    }
    @IBAction func previousButtonAction(_ sender: Any) {
        AppRouter.init().route(routeName: AppHelper.Route.previous.rawValue, fromContext: self, parameter: nil) 
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        
        if optionSelected == true{ // if answer is seleted, we move to the next view controller passing previous and this viewcontrollers data.
            
            let getData = ["name": name! ,"cricketerSelected" : cricketerSelected!]
            AppRouter.init().route(routeName: AppHelper.Route.flag.rawValue, fromContext: self, parameter: getData)
            
        }else{ //alert appears when answer not selected.
            
            let alert = UIAlertController(title: "Information", message: "Please Select an Option!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func radioButtonAction(_ sender: UIButton) {
        
        optionSelected = true //answer is selected so making it as true.
        
        //according to the button tag,values is changed and selected value is stored.
        
        if sender.tag == 0{
            optionOneView.backgroundColor = UIColor(red: 183.0/255.0, green: 55.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            optionTwoView.backgroundColor = .white
            optionThreeView.backgroundColor = .white
            optionFourView.backgroundColor = .white
            
            OptionOneLabel.textColor = .white
            optionTwoLabel.textColor = UIColor(red: 183.0/255.0, green: 55.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            optionThreeLabel.textColor = UIColor(red: 183.0/255.0, green: 55.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            optionFourLabel.textColor = UIColor(red: 183.0/255.0, green: 55.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            
            cricketerSelected = "Sachin Tendulkar"
            
        }else if sender.tag == 1{
            optionOneView.backgroundColor = .white
            optionTwoView.backgroundColor = UIColor(red: 183.0/255.0, green: 55.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            optionThreeView.backgroundColor = .white
            optionFourView.backgroundColor = .white
            
            OptionOneLabel.textColor = UIColor(red: 183.0/255.0, green: 55.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            optionTwoLabel.textColor = .white
            optionThreeLabel.textColor = UIColor(red: 183.0/255.0, green: 55.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            optionFourLabel.textColor = UIColor(red: 183.0/255.0, green: 55.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            
            cricketerSelected = "Virat Kohli"
            
        }else if sender.tag == 2{
            optionOneView.backgroundColor = .white
            optionTwoView.backgroundColor = .white
            optionThreeView.backgroundColor = UIColor(red: 183.0/255.0, green: 55.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            optionFourView.backgroundColor = .white
            
            OptionOneLabel.textColor = UIColor(red: 183.0/255.0, green: 55.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            optionTwoLabel.textColor = UIColor(red: 183.0/255.0, green: 55.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            optionThreeLabel.textColor = .white
            optionFourLabel.textColor = UIColor(red: 183.0/255.0, green: 55.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            
            cricketerSelected = "Adam Gilchirst"
            
        }else if sender.tag == 3{
            optionOneView.backgroundColor = .white
            optionTwoView.backgroundColor = .white
            optionThreeView.backgroundColor = .white
            optionFourView.backgroundColor = UIColor(red: 183.0/255.0, green: 55.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            
            OptionOneLabel.textColor = UIColor(red: 183.0/255.0, green: 55.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            optionTwoLabel.textColor = UIColor(red: 183.0/255.0, green: 55.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            optionThreeLabel.textColor = UIColor(red: 183.0/255.0, green: 55.0/255.0, blue: 192.0/255.0, alpha: 1.0)
            optionFourLabel.textColor = .white
            
            cricketerSelected = "Jacques Kallis"
            
        }
        
    }
    
}
