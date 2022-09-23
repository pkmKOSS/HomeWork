//
//  CheckViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 23.09.2022.
//

import UIKit

/// VC сцена с чеком
class CheckViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    private var completeAlert: UIAlertController = UIAlertController()
    private var progressBarTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configAndStartProgressBarTimer()
    }
    
    private func configAndStartProgressBarTimer() {
        self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                                     selector: #selector(updateProgressView), userInfo: nil,
                                                     repeats: true)
        completeAlert = UIAlertController(title: " Ваш заказ готов! ", message: nil, preferredStyle: .alert)
        completeAlert.addAction(UIAlertAction(title: " Хорошо! ", style: .cancel))
    }
    
    @objc func updateProgressViewAction() {
        progressView.progress += 0.002
        progressView.setProgress(progressView.progress, animated: true)
        if progressView.progress == 1 {
            present(completeAlert, animated: true)
            progressBarTimer = Timer()
        }
    }
}
