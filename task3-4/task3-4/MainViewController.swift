//
//  ViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

/// Стартовый экран
final class MainViewController: UIViewController {
    
    // MARK: - private properties
    
    private var imageForFacebook = UIImage()
    
    @IBOutlet weak var forSharingImageView: UIImageView!
    @IBOutlet weak var imageSharingButton: UIButton!
    @IBOutlet weak var forSharingPicker: UIDatePicker!
    @IBOutlet weak var dateSharingButton: UIButton!
    @IBOutlet weak var forSharingTextField: UITextField!
    @IBOutlet weak var forTextFieldSharingButton: UIButton!
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
    }
    
    private func configViews() {
        forSharingImageView.image = UIImage(named: "Безмятежность")
    }
    
    // MARK: - IBActions
    
    @IBAction func buttonForIamgeSharingAction(_ sender: Any) {
        let activityController = UIActivityViewController(activityItems: [imageForFacebook], applicationActivities: nil)
        present(activityController, animated: true)
        
    }
    @IBAction func butonForDateSharingAction(_ sender: Any) {
        let dateStyle = Date.FormatStyle.DateStyle.numeric
        let timeStyle = Date.FormatStyle.TimeStyle.standard
        let activityController = UIActivityViewController(
            activityItems: ["\(forSharingPicker.date.formatted(date: dateStyle, time: timeStyle))"],
            applicationActivities: nil
        )
        present(activityController, animated: true)
    }
    @IBAction func buttonForTextFieldSharingAction(_ sender: Any) {
        let textFieldIsEmptyAlert = UIAlertController(
            title: "Текстовое поле пусто!",
            message: "Напиши друзьям хоть что нибудь!",
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: "Ok", style: .default)
        textFieldIsEmptyAlert.addAction(alertAction)
        
        guard forSharingTextField.text?.isEmpty != true else {present(textFieldIsEmptyAlert, animated: true); return }
        let activityController = UIActivityViewController(
            activityItems: [forSharingTextField.text],
            applicationActivities: nil
        )
        present(activityController, animated: true)
    }
    
    // MARK: - private @objc funcs
    
    @objc func selectImageForShareAction() {
        imageForFacebook = forSharingImageView.image ?? UIImage()
    }
}
