//
//  HistoryViewController.swift
//  Trivia
//
//  Created by Adaikalraj on 06/03/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var historyTableView: UITableView!
    
    var gameData: [NSManagedObject] = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableview setup
        historyTableView.delegate = self
        historyTableView.dataSource = self
        historyTableView.rowHeight = UITableView.automaticDimension
        historyTableView.estimatedRowHeight = 120
        historyTableView.separatorStyle = .none
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // to fetch data from coreData.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "GameData")
        request.returnsObjectsAsFaults = false
        do {
            gameData = try context.fetch(request) as! [NSManagedObject]
            gameData.reverse()
            historyTableView.reloadData()
            
        } catch {
            let alert = UIAlertController(title: "Error", message: "Could not fetch data.Please try later.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func homeButtonAction(_ sender: Any) {
        let nextViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        self.navigationController?.pushViewController(nextViewController!, animated: true)
    }
    
    
    //tableview delegates and datasource.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell") as! HistoryTableViewCell
        cell.selectionStyle = .none
        let data = gameData[indexPath.row]
        cell.gameCountLabel.text = "Game " + String(indexPath.row + 1)
        cell.timeLabel.text = data.value(forKey: "time") as? String
        cell.nameLabel.text = data.value(forKey: "name") as? String
        cell.cricketLabel.text = data.value(forKey: "cricket") as? String
        cell.colorLabel.text = data.value(forKey: "colors") as? String
        return cell
    }
    
}
