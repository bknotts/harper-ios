//
//  GameboardCollectionViewController.swift
//  Harper
//
//  Created by Nicolas Cramer on 10/25/17.
//  Copyright © 2017 Nicolas Scott. All rights reserved.
//

import UIKit

private let reuseIdentifier = "gameboardSkillCell"

class GameboardCollectionViewController: UICollectionViewController {
    
    var gameboardLevels = ["LEVEL ONE"]
    var gameboardNames = ["Name & Attention", "School Supplies", "Luring Basics", "Our Cheat Sheet", "The Pledge"]
    var gameboardDescriptions = ["No matter whether you’re new to training or not, let’s start with some quick fundamentals.", "Make it easy on yourself. Start out with the right gear and environment for your dog to succeed.", "Find out how to use a reward to guide your dog. This is how we’ll start off in many future skills.", "In 10 minutes you'll be a better dog trainer than 90% of the world.", "Before we go any further, there’s something we should take care of first. Then you’ll be ready."]
    
    var gameboardSkillGames = [["The Name Game", "May I Have Your Attention"], ["Get the Stuff", "Easy Environment"], ["That Treat Is So Alluring"], ["Why Train Your Dog", "What is Dog Training Anyway", "The Top 7 Tips for a Happy, Healthy Dog", "The 7 Best Ways To End Up With a Poorly Behaved Dog"], ["The Pledge"]]
    
    var gameboardImages = ["example-slide-image", "school-supplies-cover", "luring-basics-cover", "cheat-sheet-cover", "commit-to-be-awesome"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateNavigationBar()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return gameboardLevels.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return gameboardNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameboardSkillCell", for: indexPath) as! GameboardCollectionViewCell
        
        let cellImageCornerRadius : CGFloat = 14
        
        cell.gameboardSkillCellName.text = gameboardNames[indexPath.row]
        cell.gameboardSkillCellImage.image = UIImage(named: gameboardImages[indexPath.row])
        cell.gameboardSkillCellImageContainer.layer.cornerRadius = cellImageCornerRadius
        cell.gameboardSkillCellImagePlaceholder.layer.cornerRadius = cellImageCornerRadius
        cell.gameboardSkillCellImagePlaceholder.layer.shadowColor = UIColor.black.cgColor
        cell.gameboardSkillCellImagePlaceholder.layer.shadowOpacity = 0.20
        cell.gameboardSkillCellImagePlaceholder.layer.shadowOffset = CGSize(width: 0, height: 4)
        cell.gameboardSkillCellImagePlaceholder.layer.shadowRadius = 4

    
        // Configure the cell
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {

            case UICollectionElementKindSectionHeader:

            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "collectionViewSectionHeader", for: indexPath) as! GameboardCollectionReusableView
            
            headerView.label.text = gameboardLevels[indexPath.row]
            
            return headerView
        
        default:

            assert(false, "Unexpected element kind")
        }
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSkill" {
            
            if let indexPath = self.collectionView?.indexPath(for: sender as! UICollectionViewCell) {
                
                let skillView = segue.destination as! SkillTableViewController
                
                skillView.skillImage = gameboardImages[indexPath.row] as String
                skillView.skillName = gameboardNames[indexPath.row] as String
                skillView.skillDescription = gameboardDescriptions[indexPath.row] as String
                skillView.skillGameNames = gameboardSkillGames[indexPath.row] as [String]
                
                
            }
        }
    }
    
    func updateNavigationBar() {
        
        let navBar = self.navigationController?.navigationBar
        navBar?.tintColor = UIColor.black
        navBar?.barTintColor = UIColor.white
        navBar?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBar?.shadowImage = UIImage()
        

        let titleLabel = UILabel()
        
        let attributes: NSDictionary = [
            NSAttributedStringKey.font:UIFont(name: "GT Eesti Display", size: 13)!,
            NSAttributedStringKey.foregroundColor:UIColor.black,
            NSAttributedStringKey.kern:CGFloat(1.18)
        ]
        
        let attributedTitle = NSAttributedString(string: "FITZGERALD'S PLAN", attributes: attributes as? [NSAttributedStringKey : Any])
        
        titleLabel.attributedText = attributedTitle
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
        
        
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 48, height: 48))
        button.setBackgroundImage(UIImage(named: "example-dog-avatar"), for: .normal)
        button.setTitle("", for: .normal)
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.borderWidth = 2
        button.clipsToBounds = true
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.20
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        
        
        
        button.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
    }
    
    
    @objc func menuButtonTapped(sender: UIBarButtonItem) {
        
        print("Menu button tapped")

    }

}
