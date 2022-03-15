//
//  PostViewController.swift
//  Navigation
//
//  Created by Sergey on 14.03.2022.
//

import UIKit

class PostViewController: UIViewController {
    var titlePost: String = "Пост о разном"
    private lazy var infoButton = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(clickButton))
    
    
    private func setupView() {
            self.view.backgroundColor = .lightGray
            self.navigationItem.title = titlePost
        }
    
    override func viewDidLoad() {
        setupView()
        self.navigationItem.rightBarButtonItem = infoButton
    }


    @objc private func clickButton() {  // Действие кнопки
            let infoViewController = InfoViewController()   // Создаем InfoViewController
            infoViewController.modalPresentationStyle = .automatic  //  должен показаться модально
            infoViewController.title = "Информация"// почему-то не выводится
            present(infoViewController, animated: true, completion: nil) // Вызываем InfoViewController
        
        }
}
