//
//  PersonProfileScreenViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 25.09.2022.
//

import UIKit

/// Контроллер  экрана создания профайла именника.
class PersonProfileScreenViewController: UIViewController {
    
    // MARK: - private properties
    
    private var cancelButton = UIButton()
    private var addButton = UIButton()
    private var avatarImage = UIImageView()
    private var changePhotoButton = UIButton()
    private var viewStack = UIStackView()
    private var nameLabel = UILabel()
    private var nameTextfield = UITextField()
    private var dateLabel = UILabel()
    private var dateTF = UITextField()
    private var datePicker = UIDatePicker()
    private var ageLabel = UILabel()
    private var ageTF = UITextField()
    private var agePicker = UIPickerView()
    private var firstGrayLine = UIView()
    private var secondGrayLine = UIView()
    private var thirdGrayLine = UIView()
    private var fourGrayLine = UIView()
    private var sexLabel = UILabel()
    private var sexTF = UITextField()
    private var sexPicker = UIPickerView()
    private var sex = ["Мужской", "Женский"]
    private var instLabel = UILabel()
    private var instTF = UITextField()
    private var instAlert = UIAlertController()
    private var button = UIButton()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configeViews()
        instTF.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(instAlert, animated: true)
    }
    // MARK: - private funcs
    
    private func configeViews() {
        cancelButton = UIButton(
            frame: CGRect(
                x: 5,
                y: 15,
                width: 100,
                height: 30
            )
        )
        cancelButton.setTitle(" Отмена ", for: .normal)
        cancelButton.setTitleColor(.systemBlue, for: .normal)
        
        addButton = UIButton(
            frame: CGRect(
                x: view.frame.width - 100,
                y: cancelButton.frame.origin.y,
                width: 100,
                height: 30)
        )
        addButton.setTitle(" Добавить ", for: .normal)
        addButton.setTitleColor(.systemBlue, for: .normal)
        
        avatarImage = UIImageView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 100,
                height: 100
            )
        )
        
        avatarImage.image = UIImage(named: "unkownUser")
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = 45
        avatarImage.center.x = view.center.x
        avatarImage.center.y = cancelButton.frame.origin.y + cancelButton.frame.height + 60
        
        changePhotoButton = UIButton(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 150,
                height: 30
            )
        )
        changePhotoButton.center.x = avatarImage.center.x
        changePhotoButton.frame.origin.y = avatarImage.frame.origin.y + avatarImage.frame.height + 15
        
        changePhotoButton.setTitle(" Изменить фото ", for: .normal)
        changePhotoButton.setTitleColor(.systemBlue, for: .normal)
        
        addNameLabel()
        addNameTextfield()
        addFirstGrayLine()
        addDataLabel()
        addDateTF()
        addSecondGrayLine()
        addDatePicker()
        addAgeLabel()
        addAgeTextfield()
        addAgePicker()
        addThirdGrayLine()
        addSexLabel()
        addSexTF()
        addFourGrayLine()
        addInstLabel()
        addInstTF()
        addSexPicker()
        createInstagramAlert()
        
        view.addSubview(cancelButton)
        view.addSubview(addButton)
        view.addSubview(avatarImage)
        view.addSubview(changePhotoButton)
    }

    private func addNameLabel() {
        nameLabel = UILabel(
            frame: CGRect(
                x: cancelButton.frame.origin.x + 25,
                y: changePhotoButton.frame.origin.y + changePhotoButton.frame.height + 50,
                width: 100,
                height: 30
            )
        )
        view.addSubview(nameLabel)
        nameLabel.text = "Имя"
        nameLabel.textAlignment = .left
        nameLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        nameLabel.textColor = #colorLiteral(red: 0.6033687592, green: 0.7094841599, blue: 0.8913583159, alpha: 1)
    }
    
    private func addNameTextfield() {
        nameTextfield = UITextField(
            frame: CGRect(
                x: nameLabel.frame.origin.x,
                y: nameLabel.frame.origin.y + 25,
                width: 350,
                height: 30
            )
        )
        nameTextfield.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        nameTextfield.placeholder = " Введите имя "
        view.addSubview(nameTextfield)
    }
    
    private func addFirstGrayLine() {
        firstGrayLine = UIView(frame: CGRect(
            x: nameLabel.frame.origin.x,
            y: nameTextfield.frame.origin.y + 30,
            width: 300,
            height: 1)
        )
        firstGrayLine.backgroundColor = .lightGray
        view.addSubview(firstGrayLine)
    }
    
    private func addDataLabel() {
        dateLabel = UILabel(
            frame: CGRect(
                x: nameLabel.frame.origin.x,
                y: firstGrayLine.frame.origin.y + 20,
                width: 100,
                height: 30
            )
        )
        dateLabel.text = "Дата"
        dateLabel.textAlignment = .left
        dateLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        dateLabel.textColor = #colorLiteral(red: 0.6033687592, green: 0.7094841599, blue: 0.8913583159, alpha: 1)
        view.addSubview(dateLabel)
    }
    
    private func addDateTF() {
        dateTF = UITextField(
            frame: CGRect(
                x: nameLabel.frame.origin.x,
                y: dateLabel.frame.origin.y + 25,
                width: 350,
                height: 30
            )
        )
        dateTF.placeholder = " Введите дату "
        view.addSubview(dateTF)
    }
    
    private func addDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = .init(identifier: "Russian")
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(datePickerAction))
        toolBar.setItems([barButton], animated: true)
        dateTF.inputAccessoryView = toolBar
        dateTF.inputView = datePicker
    }
    
    @objc func datePickerAction() {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = .init(identifier: "Russian")
        
        dateTF.text = formatter.string(from: datePicker.date)
    }
    
    private func addSecondGrayLine() {
        secondGrayLine = UIView(frame: CGRect(
            x: nameLabel.frame.origin.x,
            y: dateTF.frame.origin.y + 30,
            width: 300,
            height: 1)
        )
        secondGrayLine.backgroundColor = .lightGray
        view.addSubview(secondGrayLine)
    }
    
    private func addAgeLabel() {
        ageLabel = UILabel(
            frame: CGRect(
                x: nameLabel.frame.origin.x,
                y: secondGrayLine.frame.origin.y + 20,
                width: 100,
                height: 30
            )
        )
        ageLabel.text = "Возраст"
        ageLabel.textAlignment = .left
        ageLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        ageLabel.textColor = #colorLiteral(red: 0.6033687592, green: 0.7094841599, blue: 0.8913583159, alpha: 1)
        view.addSubview(ageLabel)
    }
    
    private func addAgeTextfield() {
        ageTF = UITextField(
            frame: CGRect(
                x: nameLabel.frame.origin.x,
                y: ageLabel.frame.origin.y + 25,
                width: 350,
                height: 30
            )
        )
        ageTF.placeholder = " Введите возраст "
        view.addSubview(ageTF)
    }
    
    private func addAgePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        agePicker.dataSource = self
        agePicker.delegate = self
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(agePickerAction))
        toolbar.setItems([doneButton], animated: true)
        ageTF.inputAccessoryView = toolbar
        ageTF.inputView = agePicker
    }
    
    @objc func agePickerAction() {
        ageTF.text = String(agePicker.selectedRow(inComponent: 0))
        view.endEditing(true)
    }
    
    private func addThirdGrayLine() {
        thirdGrayLine = UIView(frame: CGRect(
            x: nameLabel.frame.origin.x,
            y: ageTF.frame.origin.y + 30,
            width: 300,
            height: 1)
        )
        thirdGrayLine.backgroundColor = .lightGray
        view.addSubview(thirdGrayLine)
    }
    
    private func addSexLabel() {
        sexLabel = UILabel(
            frame: CGRect(
                x: nameLabel.frame.origin.x,
                y: thirdGrayLine.frame.origin.y + 25,
                width: 100,
                height: 30
            )
        )
        sexLabel.text = "Пол"
        sexLabel.textAlignment = .left
        sexLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        sexLabel.textColor = #colorLiteral(red: 0.6033687592, green: 0.7094841599, blue: 0.8913583159, alpha: 1)
        view.addSubview(sexLabel)
    }
    
    private func addSexTF() {
        sexTF = UITextField(
            frame: CGRect(
                x: nameLabel.frame.origin.x,
                y: sexLabel.frame.origin.y + 25,
                width: 350,
                height: 30
            )
        )
        sexTF.placeholder = " Выберите пол "
        view.addSubview(sexTF)
    }
    
    private func addSexPicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        sexPicker.dataSource = self
        sexPicker.delegate = self
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(sexPickerAction))
        toolbar.setItems([doneButton], animated: true)
        sexTF.inputAccessoryView = toolbar
        sexTF.inputView = sexPicker
    }
    
    @objc func sexPickerAction() {
        view.endEditing(true)
    }
    
    private func addFourGrayLine() {
        fourGrayLine = UIView(frame: CGRect(
            x: nameLabel.frame.origin.x,
            y: sexTF.frame.origin.y + 30,
            width: 300,
            height: 1)
        )
        fourGrayLine.backgroundColor = .lightGray
        view.addSubview(fourGrayLine)
    }
    
    private func addInstLabel() {
        instLabel = UILabel(
            frame: CGRect(
                x: nameLabel.frame.origin.x,
                y: fourGrayLine.frame.origin.y + 25,
                width: 100,
                height: 30
            )
        )
        instLabel.text = "Инстаграм"
        instLabel.textAlignment = .left
        instLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        instLabel.textColor = #colorLiteral(red: 0.6033687592, green: 0.7094841599, blue: 0.8913583159, alpha: 1)
        view.addSubview(instLabel)
    }
    
    private func addInstTF() {
        instTF = UITextField(
            frame: CGRect(
                x: nameLabel.frame.origin.x,
                y: instLabel.frame.origin.y + 25,
                width: 350,
                height: 30
            )
        )
        instTF.placeholder = " Привяжите инстаграм "
        view.addSubview(instTF)
    }
    
    private func createInstagramAlert() {
        instAlert = UIAlertController(title: " Введите user name Instagram ", message: nil, preferredStyle: .alert)
        instAlert.addTextField()
        instAlert.textFields?.first?.placeholder = " Например Yana1997 "
        instAlert.addAction(UIAlertAction(title: "Cancel", style: .default))
        instAlert.addAction(UIAlertAction(title: " Ok ", style: .default, handler: { [self] _ in
            instTF.text = self.instAlert.textFields?.first?.text
        }))
    }
}

extension PersonProfileScreenViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var numForReturn = Int()
        if pickerView == agePicker {
            numForReturn = 110
        } else if pickerView == sexPicker {
            numForReturn = sex.count
        }
        return numForReturn
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var stringForReturn = String()
        
        if pickerView == agePicker {
            stringForReturn = String(row)
        } else if pickerView == sexPicker {
            stringForReturn = sex[row]
        }
        
        return stringForReturn
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == sexPicker {
            sexTF.text = sex[row]
        }
    }
}

extension PersonProfileScreenViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        present(instAlert, animated: true)
    }
}
