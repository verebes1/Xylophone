//
//  ViewController.swift
//  Xylophone
//
//  Created by verebes on 27/01/2018.
//  Copyright © 2018 AD Progress. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    var soundPlayer: AVAudioPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        //playSound(withName: "note\(sender.tag)")
        playSoundShorter(fileName: "note\(sender.tag).wav")
        
    }
    
    func playSoundShorter(fileName: String){
        guard let path = Bundle.main.path(forResource: fileName, ofType:nil) else {return}
        let url = URL(fileURLWithPath: path)
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.play()
        } catch let error {
            print(error.localizedDescription) // couldn't load file :(
        }
    }
    
    
   func playSound(withName fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
      
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            soundPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

            guard let soundPlayer = soundPlayer else { return }
            
            soundPlayer.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

}

