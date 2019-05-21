//
//  MovieInfo.swift
//  Gaana
//
//  Created by Mirza Ahmed Baig on 28/06/18.
//  Copyright © 2018 MAB. All rights reserved.
//

import UIKit
class MovieInfo{
    var staring:String
    var directors:String
    var musicDirectors:String
    var composers:String
    var singers:String
    
    init(staring:String,directors:String,musicDirectors:String,composers:String,singers:String) {
        self.staring=staring
        self.directors=directors
        self.musicDirectors=musicDirectors
        self.composers=composers
        self.singers=singers
    }
}
