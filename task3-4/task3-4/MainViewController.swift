//
//  ViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

/// Главный экран
final class MainViewController: UIViewController {

    @IBOutlet private weak var secondsLabel: UILabel!
    @IBOutlet private weak var startAndPauseButton: UIButton!
    @IBOutlet private weak var stopButton: UIButton!

    // MARK: - private properties

    private var stopwatchSecondsCount = 0
    private var stopwatchMSecondsCount = 0
    private var stopwatch = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func stopwatchAction(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        switch button.tag {
        case 0:
            guard stopwatch.isValid != true else {
                stopwatch.invalidate()
                return
            }
            createStopWatch()
        case 1:
            stopwatch.invalidate()
            stopwatchSecondsCount = 0
            stopwatchMSecondsCount = 0
            secondsLabel.text = "0.00"
        default:
            break
        }
    }

    private func createStopWatch() {
        stopwatch = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: {[weak self] _ in
            guard let self = self else { return }
            self.stopwatchMSecondsCount += 1
            if self.stopwatchMSecondsCount > 10 {
                self.stopwatchSecondsCount += 1
                self.stopwatchMSecondsCount = 0
            }
            self.secondsLabel.text = "\(self.stopwatchSecondsCount).\(self.stopwatchMSecondsCount)"
        })
    }
}
