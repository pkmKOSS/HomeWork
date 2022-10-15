//
//  ViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 16.10.2022.
//

import UIKit

/// Экран сверстанный с помощью констрейнтов
final class NSLayoutConstraintsViewController: UIViewController {

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
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        view.addSubview(bigView)
        bigView.addSubview(yellowView)
        bigView.addSubview(redView)
        bigView.addSubview(greenView)

        bigView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        bigView.translatesAutoresizingMaskIntoConstraints = false

        let leadingConstraint = NSLayoutConstraint(
            item: bigView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .leading,
            multiplier: 1,
            constant: -10
        )

        let topConstraint = NSLayoutConstraint(
            item: bigView,
            attribute: .top,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: redView,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: -10
        )

        let trailingConstraint = NSLayoutConstraint(
            item: bigView,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .trailing,
            multiplier: 1,
            constant: 10
        )

        let bottomConstraint = NSLayoutConstraint(
            item: bigView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: greenView,
            attribute: .bottom,
            multiplier: 1,
            constant: 10
        )

        NSLayoutConstraint.activate([
           leadingConstraint, topConstraint, trailingConstraint, bottomConstraint
        ])

        addYellowView()
        addRedView()
        addGreenView()
    }

    private func addRedView() {
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false

        let centerXConstraint = NSLayoutConstraint(
            item: redView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        )

        let bottomConstraint = NSLayoutConstraint(
            item: redView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .top,
            multiplier: 1,
            constant: -10
        )

        let widthConstraint = NSLayoutConstraint(
            item: redView,
            attribute: .width,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .width,
            multiplier: 1,
            constant: 0
        )

        let heightConstraint = NSLayoutConstraint(
            item: redView,
            attribute: .height,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .height,
            multiplier: 1,
            constant: 0
        )

        NSLayoutConstraint.activate([
            centerXConstraint, bottomConstraint, widthConstraint, heightConstraint
        ])
    }

    private func addYellowView() {
        yellowView.backgroundColor = .yellow
        yellowView.translatesAutoresizingMaskIntoConstraints = false

        let centerXConstraint = NSLayoutConstraint(
            item: yellowView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        )

        let centerYConstraint = NSLayoutConstraint(
            item: yellowView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerY,
            multiplier: 1,
            constant: 0
        )

        let widthConstraint = NSLayoutConstraint(
            item: yellowView,
            attribute: .width,
            relatedBy: .equal,
            toItem: .none,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: view.bounds.width * 0.20
        )

        let heightConstraint = NSLayoutConstraint(
            item: yellowView,
            attribute: .height,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .width,
            multiplier: 1,
            constant: 0
        )

        NSLayoutConstraint.activate([
            centerXConstraint, centerYConstraint, widthConstraint, heightConstraint
        ])
    }

    private func addGreenView() {
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false

        let centerXConstraint = NSLayoutConstraint(
            item: greenView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        )

        let topConstraint = NSLayoutConstraint(
            item: greenView,
            attribute: .top,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .bottom,
            multiplier: 1,
            constant: 10
        )

        let widthConstraint = NSLayoutConstraint(
            item: greenView,
            attribute: .width,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .width,
            multiplier: 1,
            constant: 0
        )

        let heightConstraint = NSLayoutConstraint(
            item: greenView,
            attribute: .height,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .height,
            multiplier: 1,
            constant: 0
        )

        NSLayoutConstraint.activate([
            centerXConstraint, topConstraint, widthConstraint, heightConstraint
        ])
    }
}
