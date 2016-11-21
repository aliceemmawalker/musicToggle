//
//  Global.swift
//  testing
//
//  Created by Anil on 16/04/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import UIKit
import AVFoundation

var songs = "1.mp3"

var backgroundMusicPlayer: AVAudioPlayer?

func playBackgroundMusic(filename: String) {
    let url = NSBundle.mainBundle().URLForResource(
        filename, withExtension: nil)
    if (url == nil) {
        print("Could not find file: \(filename)")
        return
    }
    
    var error: NSError? = nil
    do {
        backgroundMusicPlayer =
            try AVAudioPlayer(contentsOfURL: url!)
    } catch let error1 as NSError {
        error = error1
        backgroundMusicPlayer = nil
    }
    if backgroundMusicPlayer == nil {
        print("Could not create audio player: \(error!)")
        return
    }
    
    backgroundMusicPlayer?.numberOfLoops = -1
    backgroundMusicPlayer?.prepareToPlay()
    backgroundMusicPlayer?.play()
}
