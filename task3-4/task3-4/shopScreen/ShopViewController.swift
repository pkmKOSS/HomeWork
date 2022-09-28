//
//  ViewController.swift
//  task3-4
//
//  Created by Григоренко Александр Игоревич on 22.09.2022.
//

import UIKit

/// Экран витрины магазина.
final class ShopViewController: UIViewController {
    
    // MARK: - private properties
    
    private var shopLabel = UILabel()
    private var shoesImageView = UIImageView()
    private var boardsImageView = UIImageView()
    private var shoesLabel = UILabel()
    private var boardsLabel = UILabel()
    private var selectProductButton = UIButton()
    private var selectedKindOfProduct: KindOfProduct?
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configShoesViews()
        configBoardsViews()
        configSelectButton()
    }
    
    // MARK: - private funcs
    
    private func configShoesViews() {
        view.backgroundColor = #colorLiteral(red: 0.7830306838, green: 0.9706341035, blue: 1, alpha: 1)
        shopLabel = UILabel(frame: CGRect(
            x: view.center.x,
            y: view.frame.origin.y + 50,
            width: 250,
            height: 60)
        )
        shopLabel.center.x = view.center.x
        shopLabel.textAlignment = .center
        shopLabel.font = UIFont.italicSystemFont(ofSize: 20)
        shopLabel.numberOfLines = 0
        shopLabel.backgroundColor = .white
        shopLabel.layer.cornerRadius = 5
        shopLabel.clipsToBounds = true
        shopLabel.lineBreakMode = .byWordWrapping
        shopLabel.text = " Спортик. Все для отжиманий "
        shopLabel.textColor = .systemBlue
        view.addSubview(shopLabel)
        
        shoesImageView = UIImageView(frame: CGRect(
            x: view.center.x - shoesImageView.frame.width,
            y: shopLabel.frame.origin.y + shopLabel.frame.height + 50,
            width: 185,
            height: 185)
        )
        
        shoesImageView.image = UIImage(named: "Shoes1")
        shoesImageView.contentMode = .scaleAspectFill
        shoesImageView.backgroundColor = .white
        shoesImageView.layer.cornerRadius = 5
        shoesImageView.clipsToBounds = true
        view.addSubview(shoesImageView)
        
        boardsImageView = UIImageView(frame: CGRect(
            x: shoesImageView.frame.origin.x - shoesImageView.frame.width - 5,
            y: shopLabel.frame.origin.y + shopLabel.frame.height + 50,
            width: 185,
            height: 185)
        )
    }
    private func configBoardsViews() {
        boardsImageView.image = UIImage(named: "Board1")
        boardsImageView.backgroundColor = .white
        boardsImageView.layer.cornerRadius = 5
        boardsImageView.clipsToBounds = true
        boardsImageView.contentMode = .scaleAspectFill
        view.addSubview(boardsImageView)
        
        let gestureRecogniezerForShoesLabel = UITapGestureRecognizer(
            target: self,
            action: #selector(shoesGestoreRecognizerAction)
        )
        
        shoesLabel = UILabel(frame: CGRect(
            x: shoesImageView.frame.origin.x,
            y: shoesImageView.frame.origin.y + shoesImageView.frame.height + 10,
            width: 185,
            height: 50)
        )
        
        shoesLabel.text = " Спортивная обувь "
        shoesLabel.numberOfLines = 0
        shoesLabel.textAlignment = .center
        shoesLabel.backgroundColor = .white
        shoesLabel.textColor = .systemBlue
        shoesLabel.layer.cornerRadius = 5
        shoesLabel.clipsToBounds = true
        shoesLabel.isUserInteractionEnabled = true
        shoesLabel.addGestureRecognizer(gestureRecogniezerForShoesLabel)
        view.addSubview(shoesLabel)
        
        let gestureRecogniezerForBoardsLabel = UITapGestureRecognizer(
            target: self,
            action: #selector(boardsGestoreRecognizerAction)
        )
        boardsLabel = UILabel(frame: CGRect(
            x: boardsImageView.frame.origin.x,
            y: boardsImageView.frame.origin.y + boardsImageView.frame.height + 10,
            width: 185,
            height: 50)
        )
        
        boardsLabel.text = " Доски для сноуборда "
        boardsLabel.textAlignment = .center
        boardsLabel.numberOfLines = 0
        boardsLabel.backgroundColor = .white
        boardsLabel.lineBreakMode = .byWordWrapping
        boardsLabel.textColor = .systemBlue
        boardsLabel.layer.cornerRadius = 5
        boardsLabel.clipsToBounds = true
        boardsLabel.isUserInteractionEnabled = true
        boardsLabel.addGestureRecognizer(gestureRecogniezerForBoardsLabel)
        view.addSubview(boardsLabel)
    }
    
    private func configSelectButton() {
        selectProductButton = UIButton(frame: CGRect(
            x: view.center.x,
            y: shoesLabel.frame.origin.y + shoesLabel.frame.height + 40,
            width: 100,
            height: 30)
        )
        selectProductButton.center.x = view.center.x
        selectProductButton.setTitle(" Выбрать ", for: .normal)
        selectProductButton.setTitleColor(.white, for: .normal)
        selectProductButton.backgroundColor = .systemYellow
        selectProductButton.layer.cornerRadius = 5
        selectProductButton.addTarget(self, action: #selector(selectProductButtonAction), for: .touchUpInside)
        view.addSubview(selectProductButton)
    }
    
    // MARK: - private funcs
    
    private func selectProductAndGoAtProductScreen() {
        guard selectedKindOfProduct != nil else { return }
        let vc = ProductViewController()
        
        switch selectedKindOfProduct {
        case .shoes:
                vc.products = [
                    Product(nameOfProduct: "Red shoes",
                            nameOfImage: "Shoes1",
                            coast: 2300),
                    Product(nameOfProduct: "Green shoes",
                            nameOfImage: "Shoes2",
                            coast: 3400),
                    Product(nameOfProduct: "MultiColor shoes",
                            nameOfImage: "Shoes3",
                            coast: 5100)]
        case .boards:
                vc.products = [
                    Product(nameOfProduct: "Red board",
                            nameOfImage: "Board1",
                            coast: 10030),
                    Product(nameOfProduct: "Black board",
                            nameOfImage: "Board2",
                            coast: 9500),
                    Product(nameOfProduct: "White board",
                            nameOfImage: "Board3",
                            coast: 33100)]
        case .none:
                print("Товар не найден")
        }
        present(vc, animated: true)
        selectedKindOfProduct = nil
        selectProductButton.backgroundColor = .systemYellow
    }
    
    // MARK: - @objc funcs
    
    @objc func selectProductButtonAction() {
        selectProductAndGoAtProductScreen()
    }
    
    @objc func shoesGestoreRecognizerAction() {
        print("shoesGestoreRecognizerAction")
        selectedKindOfProduct = KindOfProduct.shoes
        shoesLabel.backgroundColor = .systemRed
        shoesLabel.textColor = .white
        boardsLabel.backgroundColor = .white
        boardsLabel.textColor = .black
        selectProductButton.backgroundColor = .systemRed
    }
    
    @objc func boardsGestoreRecognizerAction() {
        print("boardsGestoreRecognizerAction")
        selectedKindOfProduct = KindOfProduct.boards
        shoesLabel.backgroundColor = .white
        shoesLabel.textColor = .black
        boardsLabel.backgroundColor = .systemRed
        boardsLabel.textColor = .white
        selectProductButton.backgroundColor = .systemRed
    }
}

/// Перечисление содержащее виды товаров
enum KindOfProduct {
    case shoes
    case boards
}
