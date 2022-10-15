//
//  ViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

///  Экран сверстанный с помощью якорей.
final class AnchorViewContrller: UIViewController {

    // MARK: - private visual components

    private var bigView = UIView()
    private var redView = UIView()
    private var yellowView = UIView()
    private var greenView = UIView()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addBigView()
    }

    // MARK: - private methods

    private func addBigView() {
        view.backgroundColor = #colorLiteral(red: 0.6540919513, green: 1, blue: 0.8961948982, alpha: 1)
        view.addSubview(bigView)
        bigView.addSubview(yellowView)
        bigView.addSubview(redView)
        bigView.addSubview(greenView)

        bigView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        bigView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bigView.leadingAnchor.constraint(equalTo: yellowView.leadingAnchor, constant: -10),
            bigView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -10),
            bigView.trailingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 10),
            bigView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 10)
        ])

        addYellowView()
        addRedView()
        addGreenView()
    }

    private func addRedView() {
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            redView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor),
            redView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -10),
            redView.widthAnchor.constraint(equalTo: yellowView.widthAnchor),
            redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor)
        ])
    }

    private func addYellowView() {
        yellowView.backgroundColor = .yellow
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            yellowView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.20),
            yellowView.heightAnchor.constraint(equalTo: yellowView.widthAnchor)
        ])
    }

    private func addGreenView() {
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: +10),
            greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor),
            greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor)
        ])
    }
}
