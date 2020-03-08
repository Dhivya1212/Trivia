//
//  GameViewModel.swift
//  Trivia
//
//  Created by Adaikalraj on 08/03/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol GameViewModelDelegate: class{
    func didFinishLoad(status: Bool)
}

class GameViewModel: NSObject{
    
    weak var delegate : GameViewModelDelegate?
    var gameData = [NSManagedObject]()
    var noResultView = UIView()
    
    override init() {
        super.init()
        
    }
    
    //To fetch data from coreData.
    func loadData(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "GameData")
        request.returnsObjectsAsFaults = false
        
        //calls delegate function after fetching data to reload tableview.
        do {
            gameData = try context.fetch(request) as! [NSManagedObject]
            gameData.reverse()
            delegate?.didFinishLoad(status: true)
        }
            //when error occurs while fetching data from coreData.
        catch {
            delegate?.didFinishLoad(status: false)
        }
        
    }
}

extension GameViewModel: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //If some data stored.
        if gameData.count > 0{
            tableView.backgroundView = nil
            return gameData.count
        }
            //if no data stored yet.
        else{
            tableView.backgroundView = noResultView
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell") as! HistoryTableViewCell
        cell.selectionStyle = .none
        let data = gameData[indexPath.row]
        cell.timeLabel.text = data.value(forKey: "time") as? String
        cell.nameLabel.text = data.value(forKey: "name") as? String
        cell.cricketLabel.text = data.value(forKey: "cricket") as? String
        cell.colorLabel.text = data.value(forKey: "colors") as? String
        return cell
    }
    
}


