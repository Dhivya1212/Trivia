//
//  AppRouter.swift
//  Trivia
//
//  Created by Adaikalraj on 06/03/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit


//This is a common class used to navigate through ViewControllers.
class AppRouter{
    
    //This function gets from which ViewController to which ViewController to push and gets if any data needs to be passed.
    func route(routeName: String, fromContext: UIViewController, parameter: Any?) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        //route variable stores the ViewController name to which it wants to be pushed.Stores only if the name is present in AppHelper class.
        guard let route = AppHelper.Route(rawValue: routeName) else{
            return
        }
        
        //According to the routeName,ViewController is pushed.
        switch route {
        case .home:
            let nextViewController = storyBoard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
            fromContext.navigationController?.pushViewController(nextViewController, animated: true)
            break
            
        case .cricket:
            let nextViewController = storyBoard.instantiateViewController(identifier: "CricketQuestionViewController") as CricketQuestionViewController
            nextViewController.name = parameter as? String
            fromContext.navigationController?.pushViewController(nextViewController, animated: true)
            break
            
        case .flag:
            let nextViewController = storyBoard.instantiateViewController(identifier: "FlagQuestionViewController") as FlagQuestionViewController
            nextViewController.getData = parameter as? [String:Any]
            fromContext.navigationController?.pushViewController(nextViewController, animated: true)
            break
            
        case .summary:
            let nextViewController = storyBoard.instantiateViewController(identifier: "SummaryViewController") as SummaryViewController
            nextViewController.getData = parameter as? [String:Any]
            fromContext.navigationController?.pushViewController(nextViewController, animated: true)
            break
            
        case .history:
            let nextViewController = storyBoard.instantiateViewController(identifier: "HistoryViewController") as HistoryViewController
            fromContext.navigationController?.pushViewController(nextViewController, animated: true)
            break
            
        case .previous:
            fromContext.navigationController?.popViewController(animated: true)
            
        }
        
    }
    
}
