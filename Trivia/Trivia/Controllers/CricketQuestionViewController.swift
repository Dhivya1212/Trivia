//
//  CricketQuestionViewController.swift
//  Trivia
//
//  Created by Adaikalraj on 06/03/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class CricketQuestionViewController: UIViewController {
    
    @IBOutlet weak var radioOneImageView: UIImageView!
    @IBOutlet weak var radioTwoImageView: UIImageView!
    @IBOutlet weak var radioThreeImageView: UIImageView!
    @IBOutlet weak var radioFourImageView: UIImageView!
    
    var optionSelected: Bool! //to check if any option is choosen or not.
    var name:String! // for storing the previous viewcontrollers data.
    var cricketerSelected:String! // for storing the current viewcontrollers answer.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionSelected = false //initially setting option selected to false.
        
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        
        if optionSelected == true{ // if answer is seleted, we move to the next view controller passing previous and this viewcontrollers data.
            let nextViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FlagQuestionViewController") as? FlagQuestionViewController
            nextViewController!.getData = ["name": name! ,"cricketerSelected" : cricketerSelected!]
            self.navigationController?.pushViewController(nextViewController!, animated: true)
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
            radioOneImageView.image = UIImage(named: "SelectedRadio")
            radioTwoImageView.image = UIImage(named: "Radio")
            radioThreeImageView.image = UIImage(named: "Radio")
            radioFourImageView.image = UIImage(named: "Radio")
            cricketerSelected = "Sachin Tendulkar"
            
        }else if sender.tag == 1{
            radioOneImageView.image = UIImage(named: "Radio")
            radioTwoImageView.image = UIImage(named: "SelectedRadio")
            radioThreeImageView.image = UIImage(named: "Radio")
            radioFourImageView.image = UIImage(named: "Radio")
            cricketerSelected = "Virat Kohli"
            
        }else if sender.tag == 2{
            radioOneImageView.image = UIImage(named: "Radio")
            radioTwoImageView.image = UIImage(named: "Radio")
            radioThreeImageView.image = UIImage(named: "SelectedRadio")
            radioFourImageView.image = UIImage(named: "Radio")
            cricketerSelected = "Adam Gilchirst"
            
        }else if sender.tag == 3{
            radioOneImageView.image = UIImage(named: "Radio")
            radioTwoImageView.image = UIImage(named: "Radio")
            radioThreeImageView.image = UIImage(named: "Radio")
            radioFourImageView.image = UIImage(named: "SelectedRadio")
            cricketerSelected = "Jacques Kallis"
            
        }
        
    }
    
}
