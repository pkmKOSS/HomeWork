//
//  ViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

/// Экран ридера.
final class RiderViewController: UIViewController {
    
    // MARK: - private visual components
    
    private var fontSlider = UISlider()
    private var fontStylePicker = UIPickerView()
    private var colorOfFontSegmentController = UISegmentedControl()
    private var weigthOfFontsegment = UISegmentedControl()
    private var darkThemeSwitch = UISwitch()
    private var textView = UITextView()
    private var weigthLigthFont = UIFont.Weight.light
    private let weigthLigthFontArray = [UIFont.Weight.light, UIFont.Weight.heavy]
    private let colors = [UIColor.black, UIColor.gray, UIColor.red, UIColor.purple]

    // MARK: - private properties
    
    private var fontSize = CGFloat(15)
    private var fontStyle = Strings.FontStyleNames.americanTypewriter
    private let colorsName = [
        Strings.NamesOfTextColorStrings.black,
        Strings.NamesOfTextColorStrings.red,
        Strings.NamesOfTextColorStrings.gray,
        Strings.NamesOfTextColorStrings.violet
    ]
    private let nameOfFontsWeigth = ["a", "A"]
    private let fontStyles = [
        Strings.FontStyleNames.americanTypewriter,
        Strings.FontStyleNames.avenir,
        Strings.FontStyleNames.arialMT,
        Strings.FontStyleNames.avenirNextCondensed,
    ]
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    // MARK: - public funcs
    
    override func touchesBegan(_ touchesSet: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
    }
    
    // MARK: - private funcs
    
    private func configureViews() {
        title = "\(Strings.StoryStrings.name)"
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        createTextView()
        createObbservers()
        addFontSlider()
        addFontColorSegmentController()
        addWeigthOfFontsegmentController()
        addStylePicker()
    }
    
    private func createTextView() {
        let story = Strings.StoryStrings.story
        textView = UITextView(
            frame: CGRect(
                x: 25,
                y: 100,
                width: self.view.bounds.width - 50,
                height: self.view.bounds.height/2
            )
        )
        textView.textAlignment = .left
        textView.layer.cornerRadius = 10
        textView.backgroundColor = #colorLiteral(red: 0.896032393, green: 0.8703463674, blue: 0.7033513188, alpha: 1)
        textView.text = story
        textView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.font = UIFont.systemFont(ofSize: 15, weight: weigthLigthFont)
        view.addSubview(textView)
    }
    
    private func createObbservers() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(updateTextView(param:)),
            name: UIResponder.keyboardWillShowNotification, object: nil
        )
        
        NotificationCenter.default.addObserver(
            self, selector: #selector(updateTextView(param:)),
            name: UIResponder.keyboardWillHideNotification, object: nil
        )
    }
    
    private func addFontSlider() {
        fontSlider = UISlider(frame: CGRect(
            x: 0,
            y: textView.frame.origin.y + textView.frame.height + 10,
            width: self.view.bounds.width - 100,
            height: 50
        ))
        fontSlider.center.x = view.center.x
        fontSlider.minimumValue = 10
        fontSlider.maximumValue = 30
        fontSlider.addTarget(self, action: #selector(changeFontSizeAction), for: .valueChanged)
        view.addSubview(fontSlider)
    }
    
    private func addFontColorSegmentController() {
        colorOfFontSegmentController = UISegmentedControl(items: colorsName)
        colorOfFontSegmentController.frame.origin.x = 0
        colorOfFontSegmentController.center.x = view.center.x
        colorOfFontSegmentController.frame.origin.y = fontSlider.frame.origin.y + fontSlider.frame.height + 10
        colorOfFontSegmentController.addTarget(self, action: #selector(changeFontColorAction), for: .valueChanged)
        view.addSubview(colorOfFontSegmentController)
    }
    
    private func addWeigthOfFontsegmentController() {
        weigthOfFontsegment = UISegmentedControl(items: nameOfFontsWeigth)
        weigthOfFontsegment.addTarget(self, action: #selector(changeFontWeigthAction), for: .valueChanged)
        weigthOfFontsegment.frame.origin.x = 0
        weigthOfFontsegment.center.x = view.center.x
        weigthOfFontsegment.frame.origin.y = colorOfFontSegmentController.frame.origin.y
        + colorOfFontSegmentController.frame.height + 10
        view.addSubview(weigthOfFontsegment)
    }
    
    private func addStylePicker() {
        fontStylePicker = UIPickerView(frame: CGRect(
            x: 0,
            y: weigthOfFontsegment.frame.origin.y + weigthOfFontsegment.frame.height + 10,
            width: self.view.bounds.width - 100,
            height: 150
        ))
        fontStylePicker.center.x = view.center.x
        fontStylePicker.dataSource = self
        fontStylePicker.delegate = self
        view.addSubview(fontStylePicker)
    }
    
    // MARK: - @objc funcs
    
    @objc private func updateTextView(param: Notification) {
        let userInfo = param.userInfo
        let getTextViewRect = (
            userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? CGRect(
                x: 0,
                y: 0,
                width: 100,
                height: 100
            )
        let keyBoardFrame = self.view.convert(getTextViewRect, to: view.window)
        
        if param.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = UIEdgeInsets.zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyBoardFrame.height, right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        
        textView.scrollRangeToVisible(textView.selectedRange)
    }
    
    @objc private func changeFontSizeAction() {
        fontSize = CGFloat(fontSlider.value)
        textView.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
    }
    
    @objc private func changeFontColorAction() {
        textView.textColor = colors[colorOfFontSegmentController.selectedSegmentIndex]
    }
    
    @objc private func changeFontWeigthAction() {
        textView.font = UIFont.systemFont(
            ofSize: fontSize,
            weight: weigthLigthFontArray[weigthOfFontsegment.selectedSegmentIndex]
        )
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension RiderViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontStyles[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textView.font = UIFont(name: fontStyles[row], size: fontSize)
    }
}
