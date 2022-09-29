//
//  BusketViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 28.09.2022.
//

import UIKit

/// Экран корзины и заказа товара.
final class BusketViewController: UIViewController {
    
    // MARK: - public properties
    
    var orderedProduct: Product?
    
    // MARK: - private properties
    
    private var orderAlert = UIAlertController()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
    }
    
    // MARK: - private funcs
    
    private func configViews() {
        view.backgroundColor = #colorLiteral(red: 0.7830306838, green: 0.9706341035, blue: 1, alpha: 1)
        let orderView = OrderView(
            rect: CGRect(x: 10, y: 50, width: view.frame.width - 20, height: 400),
            productNameLabel: orderedProduct?.nameOfProduct ?? "Unkown",
            coastProductLabel: "\(orderedProduct?.coast ?? 0)",
            avatarOfProductImageView: UIImageView(image: UIImage(named: orderedProduct?.nameOfImage ?? "unkown"))
        )
        orderView.layer.cornerRadius = 10
        view.addSubview(orderView)
        
        let buyButton = UIButton(frame: CGRect(
            x: view.center.x,
            y: orderView.frame.origin.y + orderView.frame.height + 100,
            width: 100,
            height: 30)
        )
        buyButton.center.x = view.center.x
        buyButton.setTitle(" Купить ", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.backgroundColor = .systemYellow
        buyButton.layer.cornerRadius = 5
        buyButton.addTarget(self, action: #selector(buyAlertAction), for: .touchUpInside)
        view.addSubview(buyButton)
        
        let tellAboutButton = UIButton(frame: CGRect(
            x: buyButton.frame.origin.x,
            y: buyButton.frame.origin.y + buyButton.frame.height + 20,
            width: 200,
            height: 30)
        )
        tellAboutButton.center.x = view.center.x
        tellAboutButton.setTitle(" Рассказать друзьям ", for: .normal)
        tellAboutButton.setTitleColor(.white, for: .normal)
        tellAboutButton.backgroundColor = .systemYellow
        tellAboutButton.layer.cornerRadius = 5
        tellAboutButton.addTarget(self, action: #selector(tellAboutButtonAction), for: .touchUpInside)
        view.addSubview(tellAboutButton)
    }
    
    // MARK: - @objc funcs
    
    @objc private func buyAlertAction() {
        orderAlert = UIAlertController(
            title: " Перейти к оформлению заказа? ",
            message: nil,
            preferredStyle: .alert
        )
        
        let buyAlertAction = UIAlertAction(title: " Да, продолжить оформление ", style: .default)
        let buyCancelAlertAction = UIAlertAction(title: " Вернуться ", style: .default)

        orderAlert.addAction(buyAlertAction)
        orderAlert.addAction(buyCancelAlertAction)
        present(orderAlert, animated: true)
    }
    
    @objc private func tellAboutButtonAction() {
        let tellAboutActivityController = UIActivityViewController(activityItems: [orderedProduct?.nameOfProduct ?? "unkown"],
                                                                   applicationActivities: nil)
        present(tellAboutActivityController, animated: true)
    }
}

/// Вью информации о заказе.
class OrderView: UIView {
    
    // MARK: - private properties
    
    private let productNameLabelText: String
    private let coastProductLabelText: String
    private let avatarOfProductImageView: UIImage
    
    /// Конструктор представления с информацией о заказе.
    /// - Parameters:
    ///   - rect: Границы представления и его расположение.
    ///   - productNameLabel: Наименование товара.
    ///   - coastProductLabel: Цена товара.
    ///   - avatarOfProductImageView: Изображение товара.
    init(
        rect: CGRect,
        productNameLabel: String,
        coastProductLabel: String,
        avatarOfProductImageView: UIImageView
    ) {
        self.productNameLabelText = productNameLabel
        self.coastProductLabelText = coastProductLabel
        self.avatarOfProductImageView = avatarOfProductImageView.image ?? UIImage()
        super.init(frame: rect)
        configViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - private funcs
    
    private func configViews() {
        backgroundColor = #colorLiteral(red: 0.7830306838, green: 0.9706341035, blue: 1, alpha: 1)
        let productNameLabel = UILabel(frame: CGRect(
            x: 10,
            y: 10,
            width: 250,
            height: 50))
        
        productNameLabel.text = """
        Ваш товар:
        \(productNameLabelText)
"""
        productNameLabel.numberOfLines = 0
        productNameLabel.lineBreakMode = .byWordWrapping
        productNameLabel.textAlignment = .left
        productNameLabel.textColor = .black
        productNameLabel.layer.cornerRadius = 5
        productNameLabel.clipsToBounds = translatesAutoresizingMaskIntoConstraints
        productNameLabel.backgroundColor = .white
        addSubview(productNameLabel)
        
        let coastProductLabel = UILabel(frame: CGRect(
            x: frame.width - 150,
            y: 10,
            width: 150,
            height: 50))
        
        coastProductLabel.text = "\(coastProductLabelText).00 рублей "
        coastProductLabel.numberOfLines = 0
        coastProductLabel.textAlignment = .center
        coastProductLabel.textColor = .black
        coastProductLabel.backgroundColor = .white
        coastProductLabel.layer.cornerRadius = 5
        coastProductLabel.clipsToBounds = translatesAutoresizingMaskIntoConstraints
        addSubview(coastProductLabel)
        
        let avatarOfProductImageView = UIImageView(frame: CGRect(
            x: center.x - 15,
            y: coastProductLabel.frame.origin.y + coastProductLabel.frame.height + 50,
            width: 350,
            height: 350)
        )
        
        avatarOfProductImageView.image = avatarOfProductImageView
        avatarOfProductImageView.center.x = center.x
        avatarOfProductImageView.contentMode = .scaleAspectFill
        avatarOfProductImageView.backgroundColor = .white
        avatarOfProductImageView.layer.cornerRadius = 10
        avatarOfProductImageView.clipsToBounds = true
        addSubview(avatarOfProductImageView)
    }
}
