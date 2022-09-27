//
//  PlayerViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 26.09.2022.
//

import AVFoundation
import UIKit

/// Экран проигрывателя.
final class PlayerViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationOfTrackLabel: UILabel!
    @IBOutlet weak var nameOfTrackLabel: UILabel!
    @IBOutlet weak var songDurationProgressView: UIProgressView!
    @IBOutlet weak var lowNameOTrackLabel: UILabel!
    @IBOutlet weak var lowNameOfSingerLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var volumeSlider: UISlider!
    // MARK: - public properties
    
    var musicLibrary: [Track] = []
    var currentTrackIndex = Int()
    
    // MARK: - private properties
    
    private var player = AVAudioPlayer()
    private var isPlayerAtPaus = false
    private var pauseTimeInterval: TimeInterval?
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = getTimer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        playAndPauseAction(track: musicLibrary[currentTrackIndex])
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        playAndPauseAction(track: musicLibrary[currentTrackIndex])
    }
    
    // MARK: - IBActions
    
    @IBAction func swipeRigthButtonAction(_ sender: Any) {
        guard currentTrackIndex != musicLibrary.count - 1 &&
                currentTrackIndex <= musicLibrary.count - 1 else { return }
        playAndPauseAction(track: musicLibrary[currentTrackIndex + 1])
    }
    @IBAction func swipeLeftButtonAction(_ sender: Any) {
        guard currentTrackIndex >= 1 &&
                currentTrackIndex <= musicLibrary.count - 1 else { return }
        playAndPauseAction(track: musicLibrary[currentTrackIndex - 1])
    }
    
    @IBAction func playTrackAction(_ sender: Any) {
        guard currentTrackIndex + 1 <= musicLibrary.count else { return }
        playAndPauseAction(track: musicLibrary[currentTrackIndex])
    }
    
    @IBAction func dismissRowButtonAction(_ sender: Any) {
        player.stop()
        self.dismiss(animated: true)
    }
    @IBAction func shareButtonAction(_ sender: Any) {
        let shareActivityController = UIActivityViewController(
            activityItems: ["\(nameOfTrackLabel.text ?? "") - Greate!"],
            applicationActivities: nil
        )
        present(shareActivityController, animated: true)
    }
    
    @IBAction func volumeSliderAction(_ sender: Any) {
        player.volume = volumeSlider.value
    }
    
    // MARK: - Private funcs
    
    private func playAndPauseAction(track: Track) {
        guard musicLibrary.count >= currentTrackIndex else { return }
        albumImage.image = track.nameOfImage.image
        nameOfTrackLabel.text = track.trackName
        lowNameOTrackLabel.text = track.trackName
        lowNameOfSingerLabel.text = track.singer
        
        guard player.isPlaying == false else {
            player.pause()
            isPlayerAtPaus = true
            pauseTimeInterval = player.currentTime
            return
        }
        
        guard isPlayerAtPaus == false else {
            player.play()
            return
        }
        playTrack(track: track)
        player.play()
    }
    
    private func playTrack(track: Track, pauseTime: TimeInterval? = nil) {
      let songPath = Bundle.main.path(forResource: track.trackName, ofType: "mp3")
       
       do {try AVAudioSession.sharedInstance().setMode(.default)
           try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
           
           guard let songPath = songPath else {
               return
           }
           player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: songPath))
           currentTimeLabel.text = String(player.currentTime.stringFromTimeInterval())
           durationOfTrackLabel.text = String(player.duration.stringFromTimeInterval())
           currentTrackIndex = musicLibrary.firstIndex(of: track) ?? 0
       } catch {
           print("Что то пошло не так")
       }
    }
    
    private func getIndexOfNextTrack() -> Int {
        var index = Int()
        if currentTrackIndex <= musicLibrary.count - 2 {
            index = currentTrackIndex + 1
        } else {
            currentTrackIndex = 0
        }
        return index
    }
    
    private func getTimer() -> Timer {
        let timerForSongDurationUpdate = Timer.scheduledTimer(
            timeInterval: 0.05,
            target: self,
            selector: #selector(setSliderValue),
            userInfo: nil,
            repeats: true
        )
        
        return timerForSongDurationUpdate
    }
    
    // MARK: - @objc func
    
    @objc func setSliderValue() {
        songDurationProgressView.setProgress(Float(player.currentTime) / 200, animated: true)
        currentTimeLabel.text = player.currentTime.stringFromTimeInterval()
    }
}
