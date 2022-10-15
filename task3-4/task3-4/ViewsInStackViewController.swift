//
//  StackViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 16.10.2022.
//

import UIKit

/// Экран сверстанный с помощью стеквью
final class ViewsInStackViewController: UIViewController {

    // MARK: - private visual components

    private var bigView = UIView()
    private var redView = UIView()
    private var yellowView = UIView()
    private var greenView = UIView()
    private var stackView = UIStackView()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addBigView()
    }

    // MARK: - private methods

    private func addBigView() {
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        view.addSubview(bigView)
        bigView.addSubview(stackView)

        bigView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        bigView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bigView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -10),
            bigView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: -10),
            bigView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 10),
            bigView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            bigView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
        ])

        addStackView()
        addYellowView()
        addRedView()
        addGreenView()
    }

    private func addStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(yellowView)
        stackView.addArrangedSubview(greenView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    private func addRedView() {
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            redView.widthAnchor.constraint(equalTo: yellowView.widthAnchor),
            redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor)
        ])
    }

    private func addYellowView() {
        yellowView.backgroundColor = .yellow
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yellowView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.20),
            yellowView.heightAnchor.constraint(equalTo: yellowView.widthAnchor)
        ])
    }

    private func addGreenView() {
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor),
            greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor)
        ])
    }
}
