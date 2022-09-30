//
//  EvaluateViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 03.10.2022.
//

import UIKit

/// Экран оценки приложения.
final class EvaluateViewController: UIViewController {
    
    // MARK: Visual components
    
    private var evaluateScreenLabel = UILabel()
    private var evaluateAppSlider = UISlider()
    private var evaluationLabel = UILabel()
    private var evaluateButton = UIButton()
    private var colors = [
        UIColor.red,
        UIColor.red,
        UIColor.systemRed,
        UIColor.systemRed,
        UIColor.systemYellow,
        UIColor.systemYellow,
        UIColor.yellow,
        UIColor.yellow,
        UIColor.systemGreen,
        UIColor.systemGreen
    ]
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateViews()
    }
    
    // MARK: private funcs
    
    private func configurateViews() {
        evaluateScreenLabel = UILabel(frame: CGRect(
            x: 0,
            y: 100,
            width: 350,
            height: 50)
        )
        evaluateScreenLabel.center.x = view.center.x
        evaluateScreenLabel.textAlignment = .center
        evaluateScreenLabel.text = "Пожалуйста, оцените работу приложения"
        evaluateScreenLabel.lineBreakMode = .byWordWrapping
        evaluateScreenLabel.numberOfLines = 0
        view.addSubview(evaluateScreenLabel)
        
        evaluateAppSlider = UISlider(frame: CGRect(
            x: 0,
            y: view.center.y,
            width: view.frame.width - 100,
            height: 50)
        )
        evaluateAppSlider.center.x = view.center.x
        evaluateAppSlider.value = 0.0
        evaluateAppSlider.addTarget(self, action: #selector(changeEvaluateLabelAction), for: .touchUpInside)
        view.addSubview(evaluateAppSlider)
        
        evaluationLabel = UILabel(frame: CGRect(
            x: 0,
            y: evaluateAppSlider.frame.origin.y - evaluateAppSlider.frame.height - 20,
            width: 50,
            height: 50)
        )
        evaluationLabel.center.x = view.center.x
        evaluationLabel.textAlignment = .center
        evaluationLabel.text = "1"
        view.addSubview(evaluationLabel)
        
        evaluateButton = UIButton(frame: CGRect(
            x: 0,
            y: evaluateAppSlider.frame.origin.y + evaluateAppSlider.frame.height + 20,
            width: 150,
            height: 30)
        )
        evaluateButton.center.x = view.center.x
        evaluateButton.backgroundColor = .systemOrange
        evaluateButton.clipsToBounds = true
        evaluateButton.layer.cornerRadius = 5
        evaluateButton.addTarget(self, action: #selector(evaluateAppButtonAction), for: .touchUpInside)
        evaluateButton.setTitle("Оценить", for: .normal)
        view.backgroundColor = .white
        view.addSubview(evaluateButton)
    }
    
    // MARK: - @objc funcs
    
    @objc private func changeEvaluateLabelAction() {
        evaluationLabel.text = "\(Int(evaluateAppSlider.value*10))"
        UIView.animate(withDuration: 0.5, delay: 0) {
            guard self.colors.count - 1 >= Int(self.evaluateAppSlider.value*10) else {
                self.view.backgroundColor = .green
                return }
            self.view.backgroundColor = self.colors[Int(self.evaluateAppSlider.value*10)]
        }
    }
    
    @objc private func evaluateAppButtonAction() {
        let activityController = UIActivityViewController(
            activityItems: [evaluationLabel.text],
            applicationActivities: nil
        )
        present(activityController, animated: true)
    }
}
