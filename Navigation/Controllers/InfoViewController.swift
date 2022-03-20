//
//  InfoViewController.swift
//  Navigation
//
//  Created by Sergey on 14.03.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var alertButton: UIButton = { // Создаем Alert кнопку
        let button = UIButton()  // Кнопка
        button.backgroundColor = .systemBlue  // Цвет кнопки
        button.layer.cornerRadius = 12   // Скруглим
        button.setTitle("Tap it!", for: .normal)  // Текст кнопки
        button.setTitleColor(.white, for: .normal)  // Цвет текста
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)   // Делаем жирным
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)  // Добавляем Action
        button.translatesAutoresizingMaskIntoConstraints = false // Отключаем AutoresizingMask
            
        return button
    }()
    
    private func setupView() {
        self.view.backgroundColor = .systemGray2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButton()
    }
    
    private func setupButton() {
        self.view.addSubview(self.alertButton)
        self.alertButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        self.alertButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.alertButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.alertButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
  
    @objc private func buttonAction() { // Делаем переход на UIAlertController
        self.showAlert() // Вызываем AlertController
    }
        
    private func showAlert() {  // Создаем кнопку Alert.
        let alertController = UIAlertController(title: "Attention!", message: "Red pill or blue pill?", preferredStyle: .alert) // Создаем AlertController
        
        let redButton = UIAlertAction(title: "RED", style: .default) { Action in
                print("Нажата кнопка RED") // При нажатии в консоль должно выводиться сообщение.
        }
        let blueButton = UIAlertAction(title: "BLUE", style: .default) { Action in
                print("Нажата кнопка BLUE") // При нажатии в консоль должно выводиться сообщение.
        }
        alertController.addAction(redButton) // Действие кнопок
        alertController.addAction(blueButton) // Действие кнопок
        present(alertController, animated: true, completion: nil) // Выводим на экран
    }
}
