//
//  PostViewController.swift
//  Navigation
//
//  Created by Sergey on 28.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    lazy var post = Post(title: "")
        
        private lazy var infoButton = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(clickButton))
        
        private func setupView() {
            self.view.backgroundColor = .lightGray
            self.navigationItem.title = post.title
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        override func viewDidLoad() {
            setupView()
            self.navigationItem.rightBarButtonItem = infoButton
        }

        @objc private func clickButton() {  // Действие кнопки
            let infoViewController = InfoViewController()   // Создаем InfoViewController
            infoViewController.modalPresentationStyle = .automatic  //  должен показаться модально
            present(infoViewController, animated: true, completion: nil) // Вызываем InfoViewController
        }

}
