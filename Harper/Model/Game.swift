//
//  Game.swift
//  Harper
//
//  Created by Nicolas Cramer on 10/21/17.
//  Copyright © 2017 Nicolas Scott. All rights reserved.
//

import Foundation

class Game {
    
    var contentSlides = [ContentSlide]()
    
    init() {
        
        // Create a content slide item and append it to contentSlides array
        contentSlides.append(ContentSlide(title: "Attention!", description: "Relationships at their core are about attention,  giving it or seeking it. When we need someone's attention, you often use their name.", videoName: "exampleVideoBackground", photoName: "exampleBackgroundImage"))
        
        contentSlides.append(ContentSlide(title: "What's in a name?", description: "We want to be able to use our dogs' names to get their attention. So let's start to show them why it's worth their while to respond with attention when they hear their names.", videoName: "secondExampleVideoBackground", photoName: "exampleBackgroundImage"))
        
        contentSlides.append(ContentSlide(title: "Mind your cue", description: "Hang with your dog in a quiet indoor environment. Then say his name. If he doesn't do anything that's ok. Be patient. Wait a few seconds and try again.", videoName: "exampleVideoBackground", photoName: "exampleBackgroundImage"))
    }
    
}
