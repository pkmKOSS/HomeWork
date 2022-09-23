//
//  ViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 23.09.2022.
//

import UIKit

/// VC экрана с заказом
class MainScreenViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToCheckScreen(_ sender: Any) {
        let goToCheckScreen = UIAlertController(title: " Выставить чек? ", message: nil, preferredStyle: .actionSheet)
        
        goToCheckScreen.addAction(UIAlertAction(title: "Cancel", style: .default))
        goToCheckScreen.addAction(UIAlertAction(title: "Чек", style: .default, handler: { _ in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "CheckViewController")
                    as? CheckViewController else { return }
            self.present(vc, animated: true)
        }))
        
        self.present(goToCheckScreen, animated: true)
    }
}
