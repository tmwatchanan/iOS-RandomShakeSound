//
//  ViewController.swift
//  RandomShakeSound
//
//  Created by Tommie on 2/15/17.
//  Copyright © 2017 Watchanan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    let sounds = ["boing", "explosion", "hit", "knife", "shoot", "swish", "wah", "warble"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            let randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            let audioPath = Bundle.main.path(forResource: sounds[randomNumber], ofType: "mp3")
            do {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            }
            catch {
                // error
            }
            player.play()
        }
    }
}
