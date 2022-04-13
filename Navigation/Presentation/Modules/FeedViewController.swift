//
//  FeedViewController.swift
//  Navigation
//
//  Created by Sergey on 28.03.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var buttonUp: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.setTitle("Read Post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonDown: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.setTitle("Read Post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .lightGray
        self.title = "Feed"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.addSubview(self.mainStack)
        self.mainStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.mainStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.mainStack.addArrangedSubview(self.buttonUp)
        self.mainStack.addArrangedSubview(self.buttonDown)
        self.buttonUp.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.buttonDown.widthAnchor.constraint(equalTo: self.buttonUp.widthAnchor).isActive = true
        self.buttonUp.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.buttonDown.heightAnchor.constraint(equalTo: self.buttonUp.heightAnchor).isActive = true
    }
    
    @objc private func buttonAction() {
            let postViewController = PostViewController()
            postViewController.post = eComStation
            self.navigationController?.pushViewController(postViewController, animated: true)
    }

}
