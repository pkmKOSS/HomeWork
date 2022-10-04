//
//  UserStoryViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 04.10.2022.
//

import UIKit

/// Экран историй-анекдотов
final class UserStoryViewController: UIViewController {

    // MARK: - private visual components

    @IBOutlet weak var textFoldSizeSlider: UISlider!
    @IBOutlet weak var storyPicker: UIPickerView!
    @IBOutlet weak var storyTextView: UITextView!

    // MARK: - private properties

    private let defaults = UserDefaults.standard
    private let storys = [
        Strings.armenianRadio,
        Strings.carAndBeer,
        Strings.hatAndSize,
    ]

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        storyPicker.delegate = self
        storyPicker.dataSource = self
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension UserStoryViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        3
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let selectedStory = storys[row]
        let attributedStory = (defaults.value(forKey: UserDefaultsKeys.nameKey) as? String ?? "") + selectedStory
        storyTextView.text = attributedStory
        return String(row)
    }
}
