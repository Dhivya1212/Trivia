//
//  SummaryViewController.swift
//  Trivia
//
//  Created by Adaikalraj on 06/03/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit
import CoreData

class SummaryViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var cricketerAnswer: UILabel!
    @IBOutlet weak var flagColorsAnswer: UILabel!
    
    var getData: [String:Any]! = [String:Any]() // to receive previous viewcontroller's data.
    var flagColors: String! //to store selected colors.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //filling out the summary page using getData variable's data.
        helloLabel.text = "Hello " + (getData["name"] as! String)
        cricketerAnswer.text = (getData["cricketerSelected"] as! String)
        
        let colors = getData["flagColors"] as! [String]
        if colors.count == 1{
            flagColors = colors[0]
            flagColorsAnswer.text = flagColors
        }
        else if colors.count == 2{
            flagColors = colors[0] + "," + colors[1]
            flagColorsAnswer.text = flagColors
        }
        else if colors.count == 3{
            flagColors = colors[0] + "," + colors[1] + "," + colors[2]
            flagColorsAnswer.text = flagColors
        }
        else if colors.count == 4{
            flagColors = colors[0] + "," + colors[1] + "," + colors[2] + "," + colors[3]
            flagColorsAnswer.text = flagColors
        }
    }
    
    //Moving to previous viewcontroller.
    @IBAction func previousButtonAction(_ sender: Any) {
        AppRouter.init().route(routeName: AppHelper.Route.previous.rawValue, fromContext: self, parameter: nil) 
    }
    
    //Submit button is clicked.
    @IBAction func finishButtonAction(_ sender: Any) {
        
        //gets current date.
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy hh:mm a"
        let result = formatter.string(from: date)
        
        self.save(name: (getData["name"] as! String), time: result, cricket: (getData["cricketerSelected"] as! String), colors: flagColors)
        
    }
    
    //function to store data in coreData. Entity name: GameData
    func save(name: String,time: String,cricket: String,colors: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "GameData",in: managedContext)!
        let game = NSManagedObject(entity: entity,insertInto: managedContext)
        
        game.setValue(name, forKeyPath: "name")
        game.setValue(time, forKeyPath: "time")
        game.setValue(cricket, forKeyPath: "cricket")
        game.setValue(colors, forKeyPath: "colors")
        
        //if data saved successfully, an alert is shown with two options: if we click "ok", it moves to the home page, if we click "view history",it moves to the history page.
        do {
            
            try managedContext.save()
            let alert = UIAlertController(title: "Success", message: "Sucessfully Submitted!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                AppRouter.init().route(routeName: AppHelper.Route.home.rawValue, fromContext: self, parameter: nil)
            }))
            alert.addAction(UIAlertAction(title: "View History", style: .default, handler: { action in
                AppRouter.init().route(routeName: AppHelper.Route.history.rawValue, fromContext: self, parameter: nil)                
            }))            
            self.present(alert, animated: true)
            
        }
        catch { // alert pops-up if there is any trouble in saving data.
            
            let alert = UIAlertController(title: "Error", message: "Could not save.Please click 'Finish' again.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}
