//
//  ViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

/// Главный экран с крутилками для лейбла.
final class MainScreenViewController: UIViewController {

    // MARK: - visual components

    private var headLabel = UILabel()
    private var fontSizeSlider = UISlider()
    private var textColorPicker = UIPickerView()
    private var numberOfLinesPicker = UIPickerView()
    private var textForLabelTextField = UITextField()
    private var colors = [UIColor.black, UIColor.red, UIColor.blue, UIColor.yellow]

    // MARK: - private properties

    private var colorsName = [
        Strings.ColorsNames.black,
        Strings.ColorsNames.red,
        Strings.ColorsNames.blue,
        Strings.ColorsNames.yellow
    ]
    private var numberOfLine = [0, 1, 2, 3, 4, 5, 6]

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    // MARK: - private funcs

    private func configureViews() {
        createNavigationBar()
        addHeadLabel()
        addFontSizeSlider()
        addTextColorPicker()
        addNumberOfLinesPicker()
        addTextForLabelTextField()
        addDelegate()
    }
    private func addDelegate() {
        textForLabelTextField.delegate = self
    }

    private func createNavigationBar() {
        navigationItem.title = "Lesson 12"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self, action: #selector(addTextAlertAction)
        )
        let image = UIImage(named: "global-2")
        let barItem = UITabBarItem(title: "ManViewController", image: image, tag: 0)
        tabBarItem = barItem
    }

    private func addHeadLabel() {
        headLabel = UILabel(frame: CGRect(
            x: 50,
            y: 100,
            width: view.frame.width - 100,
            height: view.frame.height / 7)
        )
        headLabel.center.x = view.center.x
        headLabel.minimumScaleFactor = 0.5
        headLabel.font = UIFont.boldSystemFont(ofSize: 25)
        headLabel.textAlignment = .center
        headLabel.numberOfLines = 0
        headLabel.lineBreakMode = .byWordWrapping
        headLabel.shadowOffset = .init(width: 2, height: 2)
        headLabel.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        headLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        headLabel.layer.borderWidth = 1
        headLabel.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addSubview(headLabel)
    }

    private func addFontSizeSlider() {
        fontSizeSlider = UISlider(frame: CGRect(
            x: 50,
            y: headLabel.frame.origin.y + headLabel.frame.height + 25,
            width: view.frame.width - 100,
            height: 40)
        )
        fontSizeSlider.maximumValue = 100
        fontSizeSlider.minimumValue = 1
        fontSizeSlider.addTarget(self, action: #selector(changeFontAction), for: .valueChanged)
        view.addSubview(fontSizeSlider)
    }

    private func addTextColorPicker() {
        textColorPicker = UIPickerView(frame: CGRect(
            x: 50,
            y: fontSizeSlider.frame.origin.y + fontSizeSlider.frame.height + 25,
            width: view.frame.width - 100,
            height: 150)
        )
        textColorPicker.tag = 0
        textColorPicker.dataSource = self
        textColorPicker.delegate = self
        view.addSubview(textColorPicker)
    }

    private func addNumberOfLinesPicker() {
        numberOfLinesPicker = UIPickerView(frame: CGRect(
            x: 50,
            y: textColorPicker.frame.origin.y + textColorPicker.frame.height,
            width: view.frame.width - 100,
            height: 150)
        )
        numberOfLinesPicker.tag = 1
        numberOfLinesPicker.dataSource = self
        numberOfLinesPicker.delegate = self
        view.addSubview(numberOfLinesPicker)
    }

    private func addTextForLabelTextField() {
        textForLabelTextField = UITextField(frame: CGRect(
            x: 50,
            y: numberOfLinesPicker.frame.origin.y + numberOfLinesPicker.frame.height + 10,
            width: view.frame.width - 100,
            height: 50)
        )
        textForLabelTextField.borderStyle = .roundedRect
        textForLabelTextField.layer.borderWidth = 1
        textForLabelTextField.layer.borderColor = UIColor.black.cgColor
        view.addSubview(textForLabelTextField)
    }

    // MARK: - @objc funcs

    @objc private func addTextAlertAction() {
        let alert = UIAlertController(
            title: Strings.TextForAlert.atentionString,
            message: Strings.TextForAlert.inputDataString,
            preferredStyle: .alert)

        alert.addTextField { field in
            field.placeholder = Strings.TextForAlert.someDataString
            field.returnKeyType = .next
            field.keyboardType = .default
        }

        alert.addAction(UIAlertAction(title: Strings.TextForAlert.enterString, style: .default, handler: {_ in
            self.headLabel.text = alert.textFields?.first?.text
        }))

        present(alert, animated: true, completion: nil)
    }

    @objc private func changeFontAction() {
        headLabel.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSizeSlider.value))
    }
}

// Добавляет методы делегата и датасорс UIPickerView
extension MainScreenViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView.tag {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 1
        }
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return colors.count
        case 1:
            return numberOfLine.count
        default:
            return 1
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            headLabel.textColor = colors[row]
        case 1:
            headLabel.numberOfLines = numberOfLine[row]
        default:
            print("Unowned result")
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return String?("\(colorsName[row])")
        case 1:
            return String?("\(numberOfLine[row])")
        default:
            return nil
        }
    }
}

extension MainScreenViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField, shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool {
        headLabel.text = textField.text
        return true
    }
}
