//
//  HistoryViewController.swift
//  Trivia
//
//  Created by Adaikalraj on 06/03/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController{
    
    @IBOutlet weak var historyTableView: UITableView!
    @IBOutlet var noResultView: UIView!
    
    var viewModel = GameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableview setup
        historyTableView.delegate = viewModel
        historyTableView.dataSource = viewModel
        historyTableView.rowHeight = UITableView.automaticDimension
        historyTableView.estimatedRowHeight = 120
        historyTableView.separatorStyle = .none
        
        viewModel.delegate = self
        viewModel.noResultView = noResultView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadData()
    }
    
    //moving to home page.
    @IBAction func homeButtonAction(_ sender: Any) {
        AppRouter.init().route(routeName: AppHelper.Route.home.rawValue, fromContext: self, parameter: nil)
    }
    
}

// protocol delegate inherited.
extension HistoryViewController: GameViewModelDelegate{
    func didFinishLoad(status: Bool) {
        if status == true{
            historyTableView.reloadData()
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Could not fetch data.Please try later.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}
