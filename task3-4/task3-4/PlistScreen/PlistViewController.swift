//
//  ViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

/// Контроллер экрана плейлиста
final class PlistViewController: UIViewController {
    
    // MARK: - private properties
    
    private var musicLibrary: [Track] = []
    private var currentTrackIndex = Int()

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMusicLibrary()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "FirstTrackPlay" else { return }
        guard let destinationFirst = segue.destination as? PlayerViewController else { return }
        destinationFirst.musicLibrary = musicLibrary
        destinationFirst.currentTrackIndex = currentTrackIndex
    }
    
    // MARK: - private Actions
    
    @IBAction func playTrackButtonAction(_ sender: Any) {
        currentTrackIndex = 0
        performSegue(withIdentifier: "FirstTrackPlay", sender: sender)
    }
    
    @IBAction func playTrackSecondButtonAction(_ sender: Any) {
        currentTrackIndex = 1
        performSegue(withIdentifier: "FirstTrackPlay", sender: sender)
    }
    
    // MARK: - private funcs
    
    private func createMusicLibrary() {
        musicLibrary.append(Track(
            singer: "Jimmy Hendricks",
            trackName: "Purplehuze",
            duration: "2:55",
            nameOfImage: UIImageView(image: UIImage(named: "Jimmy"))))
        
        musicLibrary.append(Track(
            singer: "Duft Punk",
            trackName: "GetLucky",
            duration: "4:08",
            nameOfImage: UIImageView(image: UIImage(named: "duftPunk"))))
    }
}
