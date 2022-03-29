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

        override func viewDidLoad() {
            super.viewDidLoad()
            self.setupNavigationBar()
            self.setupView()
        }
        
        func setupNavigationBar() {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationItem.title = "Profile"
        }
        
       func setupView() {
           self.view.backgroundColor = .lightGray
           self.view.addSubview(self.profileHeaderView)// добавляем хедер
           
           let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
            let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
            let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
            self.heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
           
            NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, self.heightConstraint].compactMap({$0}))
        }
}

