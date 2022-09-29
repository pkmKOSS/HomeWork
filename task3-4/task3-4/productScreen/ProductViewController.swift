//
//  ProductViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 28.09.2022.
//

import UIKit

///  Экран выбора характеристик товара.
class ProductViewController: UIViewController {
    
    // MARK: - public properties
    
    var productsNames: [String] = []
    var products: [Product] = []
    
    // MARK: - private properties
    
    private var productsImagesSegmentControl = UISegmentedControl()
    private var addProductToBusketButton = UIButton()
    private var imageView = UIImageView()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeProducts()
    }
    
    // MARK: - private funcs
    
    private func configViews() {
        view.backgroundColor = #colorLiteral(red: 0.7830306838, green: 0.9706341035, blue: 1, alpha: 1)

        for product in products {
            productsNames.append(product.nameOfProduct)
        }
        
        imageView.frame = CGRect(x: 0, y: 0, width: 350, height: 350)
        imageView.center.y = view.center.y - 100
        imageView.center.x = view.center.x
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 10
        imageView.image = UIImage(named: products.first?.nameOfImage ?? "unkown")
        view.addSubview(imageView)
        
        productsImagesSegmentControl = UISegmentedControl(items: productsNames)
        productsImagesSegmentControl.frame = CGRect(
            x: 100,
            y: imageView.frame.origin.y + imageView.frame.height + 100,
            width: 300,
            height: 30
        )
        productsImagesSegmentControl.center.x = view.center.x
        productsImagesSegmentControl.backgroundColor = .white
        productsImagesSegmentControl.selectedSegmentTintColor = .systemRed
        productsImagesSegmentControl.addTarget(self, action: #selector(selectValue), for: .valueChanged)
        view.addSubview(productsImagesSegmentControl)
        
        addProductToBusketButton = UIButton(frame: CGRect(
            x: view.center.x,
            y: productsImagesSegmentControl.frame.origin.y + productsImagesSegmentControl.frame.height + 20,
            width: 100,
            height: 30)
        )
        addProductToBusketButton.center.x = view.center.x
        addProductToBusketButton.setTitle(" Выбрать ", for: .normal)
        addProductToBusketButton.setTitleColor(.white, for: .normal)
        addProductToBusketButton.backgroundColor = .systemYellow
        addProductToBusketButton.layer.cornerRadius = 5
        addProductToBusketButton.addTarget(self, action: #selector(addProductToBusketButtonAction), for: .touchUpInside)
        view.addSubview(addProductToBusketButton)
    }
    
    private func removeProducts() {
        products.removeAll()
        productsNames.removeAll()
    }
    
    // MARK: - @objc funcs
    
    @objc func selectValue(target: UISegmentedControl) {
        if target == self.productsImagesSegmentControl {
            let segmentIndex = target.selectedSegmentIndex
            imageView.image = UIImage(named: products[segmentIndex].nameOfImage)
        }
    }
    
    @objc func addProductToBusketButtonAction() {
        let selectedProduct = products[productsImagesSegmentControl.selectedSegmentIndex]
        let vc = BusketViewController()
        vc.orderedProduct = selectedProduct
        present(vc, animated: true)
    }
}
