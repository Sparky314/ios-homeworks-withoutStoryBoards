//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Sergey on 28.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    
    private lazy var profileHeaderView: ProfileHeaderView = {
            let view = ProfileHeaderView(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
    }()
        
    private var heightConstraint: NSLayoutConstraint?
    
    private lazy var newButton: UIButton = {
        let button = UIButton()
        button.setTitle("New Button", for: .normal)
        button.backgroundColor = .systemPink
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
        self.setupNewButton()
    }
        
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Profile"
    }
        
    private func setupView() {
        self.view.backgroundColor = .lightGray
        self.view.addSubview(self.profileHeaderView)// добавляем хедер
           
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        self.heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
           
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, self.heightConstraint].compactMap({$0}))
        }
    
    private func setupNewButton(){
        self.view.addSubview(self.newButton)
        
        let leadingConstraint = self.newButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
        let trailingConstraint = self.newButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        let bottomConstraint = self.newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, bottomConstraint].compactMap({$0}))
    }
}

