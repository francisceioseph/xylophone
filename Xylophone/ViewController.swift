//
//  ViewController.swift
//  Xylophone
//
//  Created by Francisco on 03/11/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    private var audioPlayer: AVAudioPlayer?
    
    private let audioSession = AVAudioSession.sharedInstance()
    
    private let soundTagMapper = [
        0: "C",
        1: "D",
        2: "E",
        3: "F",
        4: "G",
        5: "A",
        6: "B"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func onKeyPress(_ sender: UIButton) {
        guard let note = soundTagMapper[sender.tag] else { return }
        playSound(note: note)
    }
    
    func playSound(note: String) {
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav") else { return }
        
        do {
            try audioSession.setCategory(.playback, mode: .default)
            try audioSession.setActive(true)
            
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            audioPlayer?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

