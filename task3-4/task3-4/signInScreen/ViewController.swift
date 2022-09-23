//
//  ViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

/// VC главной сцены
class ViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    let vc = MainScreenViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToMainScreenAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "vc")
                as? MainScreenViewController else { return }
        self.present(vc, animated: true)
    }

}
