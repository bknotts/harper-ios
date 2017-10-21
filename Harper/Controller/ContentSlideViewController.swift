//
//  ContentSlideViewController.swift
//  Harper
//
//  Created by Nicolas Cramer on 10/20/17.
//  Copyright © 2017 Nicolas Scott. All rights reserved.
//

import UIKit
import AVFoundation

class ContentSlideViewController: UIViewController {
    
    
    // MARK: - Properties
    var videoBackground : AVPlayer!
    var videoBackgroundLayer : AVPlayerLayer!
    var videoPaused : Bool = false
    
    @IBOutlet weak var contentSlideTitle: UILabel!
    @IBOutlet weak var contentSlideDescription: UILabel!
    @IBOutlet weak var contentCopy: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createLoopingVideoBackground(videoURL: "secondExampleVideoBackground", videoFileExtension: "mp4")
        createImageBackground(backgroundImageName: "exampleBackgroundImage")
        
        contentSlideTitle.text = "Attention!"
        contentSlideDescription.text = "We want to be able to use our dogs' names to get their attention. So let's start to show them why it's worth their while to respond with attention when they hear their names."
        updateParagraphSpacing(label: contentSlideDescription, lineSpacingValue: 5.0)
    }

    
    // MARK: - Create Background Image
    func createImageBackground(backgroundImageName: String) {
        
        
        let backgroundImage = UIImage.init(named: backgroundImageName)
        let backgroundImageView = UIImageView.init(image: backgroundImage)
        
        backgroundImageView.frame = view.layer.bounds
        backgroundImageView.contentMode = UIViewContentMode.scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubview(toBack: backgroundImageView)
        
        
    }
    
    
    // MARK: - Create Background Video Player
    func createLoopingVideoBackground(videoURL: String, videoFileExtension: String) {
        
        let videoURL = Bundle.main.url(forResource: videoURL, withExtension: videoFileExtension)
        
        if videoURL != nil {
            videoBackground = AVPlayer(url: videoURL!)
            videoBackgroundLayer = AVPlayerLayer(player: videoBackground)
            videoBackgroundLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoBackground.volume = 0
            videoBackground.actionAtItemEnd = AVPlayerActionAtItemEnd.none
            videoBackgroundLayer.frame = view.layer.bounds
            
            // Add video to view
            view.layer.insertSublayer(videoBackgroundLayer, at: 0) // This will need to change if poster image is behind it
            
            // Loop video
            NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: videoBackground.currentItem)
        }
        else {
            print("Video error")
        }
    }
    
    // Loop video function
    @objc func playerItemDidReachEnd(notification: NSNotification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: kCMTimeZero, completionHandler: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if videoBackground != nil {
            videoBackground.play()
            videoPaused = false
        }
        
        else {
            print("Error when playing video")
        }
        
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
    }
    
    
    // MARK: - Type Style
    func updateParagraphSpacing(label: UILabel, lineSpacingValue: CGFloat) {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacingValue
        let attrString = NSMutableAttributedString(string: label.text!)
        attrString.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        label.attributedText = attrString

    }
    
    
    // MARK: - Update Navigation Bar Style
    func giveNavigationBarGradient() {
        
        let navBar = self.navigationController?.navigationBar
        
        //Make navigation bar transparent
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = true
        
        // Use white text and tint
        navBar?.tintColor = UIColor.white
        navBar?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        
        // Create gradient layer
        let gradientView = UIView(frame: CGRect(x: 0, y:0, width: UIApplication.shared.statusBarFrame.width, height: UIApplication.shared.statusBarFrame.height + (navBar?.frame.height)!))
        let colorTop = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.25).cgColor
        let colorMiddle = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.15).cgColor
        let colorBottom = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorMiddle, colorBottom]
        gradientLayer.locations = [0,0.15,1]
        gradientLayer.frame = gradientView.frame
        
        self.navigationController?.view.insertSubview(gradientView, belowSubview: navBar!)
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
    
    }
    
    // TODO: What if coming back from app being suspended?
    // TODO: What if error loading photo?
    

    
    
    
    // MARK: - Navigation
    
}
