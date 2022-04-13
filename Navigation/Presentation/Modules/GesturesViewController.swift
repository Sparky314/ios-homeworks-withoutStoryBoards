//
//  GesturesViewController.swift
//  Navigation
//
//  Created by Sergey on 13.04.2022.
//

import UIKit

class GesturesViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "hell_cat"))
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var backView: UIView = {
        let backView = UIView()
        backView.isHidden = true
        backView.alpha = 0
        backView.backgroundColor = .black
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "multiply.circle.fill")
        button.setBackgroundImage(image, for: .normal)
        button.isHidden = true
        button.alpha = 0
        button.tintColor = .white
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    private var imageTopConstraint: NSLayoutConstraint?
    private var imageLeadingConstraint: NSLayoutConstraint?
    private var imageWidthConstraint: NSLayoutConstraint?
    private var imageHeightConstraint: NSLayoutConstraint?
    private var imageXConstraint: NSLayoutConstraint?
    private var imageYConstraint: NSLayoutConstraint?

    private var isExpanded = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupImage()
        self.setupGesture()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.closeButton)
        self.view.addSubview(self.backView)
        self.view.addSubview(self.imageView)
        self.view.addSubview(self.closeButton)

        let backViewTopConstraint = self.backView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let backViewLeadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let backViewTrailinConstraint = self.backView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let backViewBottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)

        let buttonTopConstraint = self.closeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50)
        let buttonTrailingConstraint = self.closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        let buttonHeightConstraint = self.closeButton.heightAnchor.constraint(equalToConstant: 40)
        let buttonWidthConstraint = self.closeButton.widthAnchor.constraint(equalToConstant: 40)

        NSLayoutConstraint.activate([backViewTopConstraint, backViewLeadingConstraint,backViewTrailinConstraint, backViewBottomConstraint, buttonTopConstraint, buttonTrailingConstraint, buttonHeightConstraint, buttonWidthConstraint ].compactMap({ $0 }))
        }
    
    private func setupImage(){
        
        if self.isExpanded {
            
            NSLayoutConstraint.deactivate([self.imageTopConstraint, self.imageLeadingConstraint, self.imageHeightConstraint, self.imageWidthConstraint].compactMap({ $0 }))
            
            self.imageHeightConstraint?.constant = self.view.bounds.height
            self.imageWidthConstraint?.constant = self.view.bounds.width
            self.imageXConstraint = self.imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            self.imageYConstraint = self.imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
      
            NSLayoutConstraint.activate([self.imageHeightConstraint, self.imageWidthConstraint, imageXConstraint, imageYConstraint].compactMap( {$0} ))
            
            self.imageView.layer.borderWidth = 0
            self.imageView.layer.masksToBounds = true
            self.imageView.layer.borderColor = nil
            self.imageView.layer.cornerRadius = 0
            
        } else {
            
            NSLayoutConstraint.deactivate([self.imageTopConstraint, self.imageLeadingConstraint, self.imageHeightConstraint, self.imageWidthConstraint, self.imageXConstraint, self.imageYConstraint].compactMap({ $0 }))
            
            self.imageView.layer.borderWidth = 3.0
            self.imageView.layer.masksToBounds = false
            self.imageView.layer.borderColor = UIColor.blue.cgColor
            self.imageView.layer.cornerRadius = 70
            self.imageView.contentMode = .scaleAspectFit
            self.imageView.clipsToBounds = true
            
            self.imageTopConstraint = self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 55)
            self.imageLeadingConstraint = self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
            self.imageHeightConstraint = self.imageView.heightAnchor.constraint(equalToConstant: 140)
            self.imageWidthConstraint = self.imageView.widthAnchor.constraint(equalToConstant: 140)
            
            NSLayoutConstraint.activate([ self.imageTopConstraint, self.imageLeadingConstraint,  self.imageHeightConstraint, self.imageWidthConstraint].compactMap({ $0 }))
            }
        }

    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(handleTapGesture(_:)))
        self.imageView.addGestureRecognizer(self.tapGestureRecognizer)
    }

    @objc private func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer === gestureRecognizer else { return }
        self.backView.isHidden = false
        self.closeButton.isHidden = false
        self.isExpanded = true
        self.setupImage()
        
        UIView.animate(withDuration: 0.5) {
            self.backView.alpha = self.isExpanded ? 0.5 : 0
            self.view.layoutIfNeeded()
        } completion: { _ in }
        
        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.closeButton.alpha = self.isExpanded ? 1 : 0
            self.view.layoutIfNeeded()
        } completion: { _ in }
    }

    @objc private func didTapButton() {
        print("Close!")
        self.backView.isHidden = true
        self.closeButton.isHidden = true
        self.isExpanded = false
        self.setupImage()
        
        UIView.animate(withDuration: 0.5) {
            self.backView.alpha = self.isExpanded ? 0.5 : 0
            self.view.layoutIfNeeded()
        } completion: { _ in }

        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.closeButton.alpha = self.isExpanded ? 1 : 0
            self.view.layoutIfNeeded()
        } completion: { _ in }
    }
}
