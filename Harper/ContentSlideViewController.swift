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

    
    override func viewDidLoad() {
        super.viewDidLoad()

        createLoopingVideoBackground(videoURL: "secondExampleVideoBackground", videoFileExtension: "mp4")
        createImageBackground(backgroundImageName: "exampleBackgroundImage")
        
    }

    
    
    
    
    
    // MARK: - Create Background Image
    func createImageBackground(backgroundImageName: String) {
        
        
        let backgroundImage = UIImage.init(named: backgroundImageName)
        let backgroundImageView = UIImageView.init(image: backgroundImage)
        
        backgroundImageView.frame = view.layer.bounds
        backgroundImageView.backgroundColor = UIColor.red
        backgroundImageView.contentMode = UIViewContentMode.scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubview(toBack: backgroundImageView)
        
        
    }
    
    
    // MARK: - Create Background Video Player
    func createLoopingVideoBackground(videoURL: String, videoFileExtension: String) {
        
        let videoURL = Bundle.main.url(forResource: videoURL, withExtension: videoFileExtension)
        
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
    
    
    // Loop video function
    @objc func playerItemDidReachEnd(notification: NSNotification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: kCMTimeZero, completionHandler: nil)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        videoBackground.play()
        videoPaused = false
    }
    
    
    // MARK: - Navigation
    
}
