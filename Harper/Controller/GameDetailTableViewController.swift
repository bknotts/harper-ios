//
//  GameDetailTableViewController.swift
//  Harper
//
//  Created by Nicolas Cramer on 10/28/17.
//  Copyright © 2017 Nicolas Scott. All rights reserved.
//

import UIKit

class GameDetailTableViewController: UITableViewController {

    var gameDetails : [String : String] = ["Where" : "Indoors", "When" : "Any time", "How long" : "2-3 minutes", "Distractions" : "None", "Rewards" : "Food treats", "Rate of reward" : "Every time"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return gameDetails.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameDetailCell", for: indexPath) as! GameDetailTableViewCell

        cell.gameDetailCellLabel.text = Array(gameDetails.keys)[indexPath.row]
        cell.gameDetailCellValue.text = Array(gameDetails.values)[indexPath.row]

        return cell
    }

}
