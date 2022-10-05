//
//  TimerViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 03.10.2022.
//

import UIKit

/// Экран таймера
final class TimerViewController: UIViewController {

    // MARK: - visual components

    @IBOutlet private weak var stopView: UIView!
    @IBOutlet private weak var countDownTimerPickerView: UIPickerView!
    @IBOutlet private weak var startView: UIView!

    // MARK: - private properties

    private var timer = Timer()
    private var secondsTime = 0
    private var minutsTime = 0
    private var hourTime = 0

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        addDelegates()
        createTapRecognaizers()
    }

    // MARK: - private funcs

    private func addDelegates() {
        countDownTimerPickerView.delegate = self
        countDownTimerPickerView.dataSource = self
    }

    private func configureViews() {
        stopView.layer.borderColor = UIColor.black.cgColor
    }

    private func createTapRecognaizers() {
        let tapGestoreRecogmaizerForStartView = UITapGestureRecognizer(target: self, action: #selector(startAction))
        startView.addGestureRecognizer(tapGestoreRecogmaizerForStartView)

        let tapGestoreRecogmaizerForStopView = UITapGestureRecognizer(target: self, action: #selector(stopTimerAction))
        stopView.addGestureRecognizer(tapGestoreRecogmaizerForStopView)
    }

    private func configurePicker() {
        secondsTime = countDownTimerPickerView.selectedRow(inComponent: 2)
        minutsTime = countDownTimerPickerView.selectedRow(inComponent: 1)
        hourTime = countDownTimerPickerView.selectedRow(inComponent: 0)

        countDownTimerPickerView.selectRow(hourTime, inComponent: 0, animated: true)
        countDownTimerPickerView.reloadComponent(0)
        countDownTimerPickerView.selectRow(minutsTime, inComponent: 1, animated: true)
        countDownTimerPickerView.reloadComponent(1)
        countDownTimerPickerView.selectRow(secondsTime, inComponent: 2, animated: true)
        countDownTimerPickerView.reloadComponent(2)
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimerAction),
            userInfo: nil,
            repeats: true)
    }

    // MARK: - @objc funcs

    @objc private func startAction() {
        configurePicker()
        startTimer()
    }

    @objc private func updateTimerAction() {
        secondsTime -= 1
        if secondsTime != 0 {
            countDownTimerPickerView.selectRow(secondsTime, inComponent: 2, animated: true)
            countDownTimerPickerView.reloadComponent(2)
        } else if secondsTime == 0 {
            minutsTime -= 1
            secondsTime = 60
            countDownTimerPickerView.selectRow(minutsTime, inComponent: 1, animated: true)
            countDownTimerPickerView.reloadComponent(1)
            countDownTimerPickerView.selectRow(secondsTime, inComponent: 2, animated: true)
            countDownTimerPickerView.reloadComponent(2)
        } else if minutsTime == 0 {
            hourTime -= 1
            minutsTime = 60
            countDownTimerPickerView.selectRow(hourTime, inComponent: 0, animated: true)
            countDownTimerPickerView.reloadComponent(0)
            countDownTimerPickerView.selectRow(minutsTime, inComponent: 1, animated: true)
            countDownTimerPickerView.reloadComponent(1)
            countDownTimerPickerView.selectRow(secondsTime, inComponent: 2, animated: true)
            countDownTimerPickerView.reloadComponent(2)
        }
    }

    @objc private func startTimerAction(_ sender: Any) {
        configurePicker()
        startTimer()
    }

    @objc private    func stopTimerAction(_ sender: Any) {
        timer.invalidate()
        countDownTimerPickerView.selectRow(0, inComponent: 0, animated: true)
        countDownTimerPickerView.reloadComponent(0)
        countDownTimerPickerView.selectRow(0, inComponent: 1, animated: true)
        countDownTimerPickerView.reloadComponent(1)
        countDownTimerPickerView.selectRow(0, inComponent: 2, animated: true)
        countDownTimerPickerView.reloadComponent(2)
    }

}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension TimerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
            case 0:
                return 24
            case 1:
                return 60
            case 2:
                return 60
            default:
                return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
            case 0:
                return "\(row) ч"
            case 1:
                return "\(row) мин"
            case 2:
                return "\(row) с"
            default:
                return ""
        }
    }
}
