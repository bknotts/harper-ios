//
//  GameDetailsContainerViewController.swift
//  Harper
//
//  Created by Nicolas Cramer on 10/30/17.
//  Copyright © 2017 Nicolas Scott. All rights reserved.
//

import UIKit

class GameDetailsContainerViewController: UIViewController {

    @IBOutlet weak var letsPlayButton: UIButton!
    
    var skillGameName : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = skillGameName
        // Do any additional setup after loading the view.
        let navBar = navigationController?.navigationBar
        navBar?.tintColor = UIColor.black
        navBar?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        navBar?.prefersLargeTitles = true
        navBar?.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont(name: "GT Eesti Display", size: 24) ?? UIFont.systemFont(ofSize: 24)]

        letsPlayButton.layer.cornerRadius = letsPlayButton.frame.height / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        
  
    }

}
