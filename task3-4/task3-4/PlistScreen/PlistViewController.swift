//
//  ViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

/// VC с плейлистом
class PlistViewController: UIViewController {
    private var delegate: PlayMusic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = PlayerViewController()
    }
    
    @IBAction func playTrackButton(_ sender: Any) {
        delegate?.openTrack(track: Track(singer: "Jimmy Hendricks",
                                         trackName: "Purplehuze",
                                         duration: "2:55"))
    }
    
    @IBAction func playSecondTrackButton(_ sender: Any) {
        delegate?.openTrack(track: Track(singer: "Duft Punk",
                                         trackName: "GetLucky",
                                         duration: "4:08"))
    }
}
