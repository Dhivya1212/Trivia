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
    
    var getData: [String:Any]! = [String:Any]() // for receiving the previous view controller's data.
    var checkList: [Bool]! // to store what are all the options selected.
    var answerArray: [String]! = [String]() //to store the colors of the selected options.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkList = [false,false,false,false]
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        
        answerArray.removeAll()
        
        if checkList.contains(true){ //if answers are selected,storing it in the array.
            
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
            
            // also moving to the next viewcontroller along with a data.
            getData["flagColors"] = answerArray
            let nextViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SummaryViewController") as? SummaryViewController
            nextViewController!.getData = getData
            self.navigationController?.pushViewController(nextViewController!, animated: true)
            
        }else{ // showing alert if answers are not selected.
            let alert = UIAlertController(title: "Information", message: "Please Select an Option!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func checkboxButtonAction(_ sender: UIButton) {
        
        //using button tag, changing the values and storing it.
        
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
