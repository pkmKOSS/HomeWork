//
//  PlayerViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 26.09.2022.
//

import AVFoundation
import UIKit
/// sdfsdf
class PlayerViewController: UIViewController {
    private var player = AVAudioPlayer()
    private var music: [Track] = [Track(singer: "Jimmy Hendricks",
                                        trackName: "Purplehuze",
                                        duration: "2:55"),
                                  Track(singer: "Duft Punk",
                                        trackName: "GetLucky",
                                        duration: "4:08")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func swipeRigthButtonAction(_ sender: Any) {
    }
    @IBAction func swipeLeftButtonAction(_ sender: Any) {
    }
    
    @IBAction func playTrackAction(_ sender: Any) {
        playTrack(trackName: music[0].trackName)
    }
    
    func playTrack(trackName: String) {
        player.volume = 100
        
        let songPath = Bundle.main.path(forResource: trackName, ofType: "mp3")
        do {try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let songPath = songPath else {
                return
            }
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: songPath))
            print("asdasd")
            player.play()
        } catch {
            print("asdasd")
        }
        player.play()
    }
}

protocol PlayMusic {
    func openTrack(track: Track)
}

extension PlayerViewController: PlayMusic {
    func openTrack(track: Track) {
        music.append(track)
        playTrack(trackName: track.trackName)
    }
}
