//
//  BirthdayScreenViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 25.09.2022.
//

import UIKit

/// Контроллер экрана со списком дней рождения и количеством дней до их наступления.
class BirthdayScreenViewController: UIViewController {
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configViews()
    }
    
    // MARK: - private funcs
    
    private func configNavBar() {
        title = " Birthday "
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        let rigthBarButton = UIBarButtonItem.init(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addBirthdayAction))
        navigationItem.rightBarButtonItem = rigthBarButton
    }
    
    private func configViews() {
        let navBarFrame = navigationController?.navigationBar.frame
        
        let jeremyBitrhDay = ViewWithBirthDays(
            rect: CGRect(
                x: 0,
                y: (navBarFrame?.origin.y ?? 0) + (navBarFrame?.height ?? 0),
                width: self.view.frame.width,
                height: 130),
            name: "Jeremy",
            dateLabelText: "10 марта, в среду исполнится 25 лет",
            daysForHP: 18
        )
        
        let mariaLuiBitrhDay = ViewWithBirthDays(
            rect: CGRect(
                x: 0,
                y: jeremyBitrhDay.frame.origin.y + jeremyBitrhDay.frame.height,
                width: self.view.frame.width,
                height: 130),
            name: "Maria Lui",
            dateLabelText: "14 апреля, в среду исполнится 35 лет",
            daysForHP: 42
        )
        
        let jonyStarkBitrhDay = ViewWithBirthDays(
            rect: CGRect(
                x: 0,
                y: mariaLuiBitrhDay.frame.origin.y + mariaLuiBitrhDay.frame.height,
                width: self.view.frame.width,
                height: 130),
            name: "Jony Stark",
            dateLabelText: "3 марта, в среду исполнится 25 лет",
            daysForHP: 11
        )
        
        view.addSubview(jeremyBitrhDay)
        view.addSubview(mariaLuiBitrhDay)
        view.addSubview(jonyStarkBitrhDay)
    }
    
    // MARK: - @objc funcs
    
    @objc private func addBirthdayAction() {
        let vc = PersonProfileScreenViewController()
        navigationController?.present(vc, animated: true)
    }
}
