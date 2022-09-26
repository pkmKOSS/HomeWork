//
//  ViewWithBirthdays.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 25.09.2022.
//

import UIKit

/// Представление отображающее информацию о контакте и его дне рождения.
final class ViewWithBirthDays: UIView {
    
    // MARK: - private properties
    
    private let avatarImageView: UIImageView
    private let nameLable: UILabel
    private let dateLable: UILabel
    private let daysContDownLable: UILabel
    private let grayLineView: UIView
    private let nameLabelText: String
    private let dateLabelText: String
    private let daysContDonwLabelText: String
    
    // MARK: - Конструктор
    
    /// Конструктор представления с информацией о дне рождения контакта.
    /// - Parameters:
    ///   - rect: Прямоугольник описывающий границы представления.
    ///   - image: Изображение аватара профайла.
    ///   - name: Имя контакта.
    ///   - dateLabelText: Информация о дне рождения.
    ///   - daysForHP: Количество дней до дня рождения.
    init(
        rect: CGRect,
        image: UIImage? = nil,
        name: String,
        dateLabelText: String,
        daysForHP: Int
    ) {
        avatarImageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 100, height: 100))
        avatarImageView.image = image ?? UIImage(named: "unkownUser")
        
        nameLable = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        dateLable = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        daysContDownLable = UILabel(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        grayLineView = UIView(frame: CGRect(x: 0, y: 0, width: 450, height: 1))
        self.nameLabelText = name
        self.dateLabelText = dateLabelText
        self.daysContDonwLabelText = String(daysForHP)
        super.init(frame: rect)
        configViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - private funcs
    
    private func configViews() {
        avatarImageView.frame.origin.y = 5
        avatarImageView.frame.origin.x = 5
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 45
        
        nameLable.frame.origin.y = avatarImageView.frame.origin.y
        nameLable.frame.origin.x = avatarImageView.frame.origin.x + avatarImageView.frame.width + 10
        nameLable.text = nameLabelText
        nameLable.font = UIFont.boldSystemFont(ofSize: 20)
        
        dateLable.frame.origin.y = nameLable.frame.origin.y + nameLable.frame.height
        dateLable.frame.origin.x = nameLable.frame.origin.x
        dateLable.text = dateLabelText
        dateLable.textColor = .lightGray

        daysContDownLable.frame.origin.y = nameLable.frame.origin.y
        daysContDownLable.frame.origin.x = frame.width - 70
        daysContDownLable.text = "\(daysContDonwLabelText) дней"
        daysContDownLable.textColor = .lightGray
        
        grayLineView.backgroundColor = .lightGray
        grayLineView.frame.origin.x = avatarImageView.frame.origin.x + 15
        grayLineView.frame.origin.y = avatarImageView.frame.origin.x + avatarImageView.frame.height + 10

        addSubview(avatarImageView)
        addSubview(nameLable)
        addSubview(dateLable)
        addSubview(daysContDownLable)
        addSubview(grayLineView)
    }
}
