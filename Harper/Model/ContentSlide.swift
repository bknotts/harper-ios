//
//  ContentSlide.swift
//  Harper
//
//  Created by Nicolas Cramer on 10/21/17.
//  Copyright © 2017 Nicolas Scott. All rights reserved.
//

import Foundation

class ContentSlide {
    
    let contentSlideTitle : String
    let contentSlideDescription : String
    let contentSlideVideoFileName : String
    let contentSlideImageFileName : String
    
    init(title: String, description: String, videoName: String, photoName: String) {
        contentSlideTitle = title
        contentSlideDescription = description
        contentSlideVideoFileName = videoName
        contentSlideImageFileName = photoName
    }
    
}
