//
//  SkillTableViewController.swift
//  Harper
//
//  Created by Nicolas Cramer on 10/25/17.
//  Copyright © 2017 Nicolas Scott. All rights reserved.
//

import UIKit

class SkillTableViewController: UITableViewController {
    
    @IBOutlet weak var skillImageView: UIImageView!
    @IBOutlet weak var skillNameLabel: UILabel!
    @IBOutlet weak var skillDescriptionLabel: UILabel!
    
    var skillImage : String!
    var skillName : String!
    var skillDescription : String!
    var skillGameNames : [String] = [""]
    var selectedGameName : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        giveNavigationBarGradient()
        
        skillImageView.image = UIImage(named: skillImage)
        skillNameLabel.text = skillName
        skillDescriptionLabel.text = skillDescription
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Games"
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return skillGameNames.count
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameListItem", for: indexPath) as! SkillTableViewCell
        
        cell.cellLabel.text = skillGameNames[indexPath.row]
        
        return cell
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        giveNavigationBarGradient()
        
        // Make status bar white content
        UIApplication.shared.statusBarStyle = .lightContent
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        // Return status bar style back to default
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        
        // TODO: - Figure out how to remove gradient sublayer from navbar.
        
    }
    
    
    // TODO: - Fix the double segue bug here.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedGameName = skillGameNames[indexPath.row]
        performSegue(withIdentifier: "showGameDetails", sender: indexPath.row)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGameDetails" {
            
            print(selectedGameName)
            
            let gameDetailsContainerViewController = segue.destination as! GameDetailsContainerViewController
            gameDetailsContainerViewController.skillGameName = selectedGameName
        }
    }
    
    func giveNavigationBarGradient() {
        
        let navBar = self.navigationController?.navigationBar
        
        //Make navigation bar transparent
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = true
        
        // Use white text and tint
        navBar?.tintColor = UIColor.white
        navBar?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        navBar?.prefersLargeTitles = false
        navBar?.topItem?.title = nil
        
        // TODO: - This is broken. Doensn't work as part of a sequence of views.
        // Create gradient layer
        //        let gradientView = UIView(frame: CGRect(x: 0, y:0, width: UIApplication.shared.statusBarFrame.width, height: UIApplication.shared.statusBarFrame.height + (navBar?.frame.height)!))
        //        let colorTop = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.25).cgColor
        //        let colorMiddle = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.15).cgColor
        //        let colorBottom = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0).cgColor
        //        let gradientLayer = CAGradientLayer()
        //        gradientLayer.colors = [ colorTop, colorMiddle, colorBottom]
        //        gradientLayer.locations  = [0,0.15,1]
        //        gradientLayer.frame = gradientView.frame
        //
        //        self.navigationController?.view.insertSubview(gradientView, belowSubview: navBar!)
        //        gradientView.layer.insertSublayer(gradientLayer, at: 0)
        
    }

}
