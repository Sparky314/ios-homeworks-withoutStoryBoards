//
//  DetailPhotoViewController.swift
//  Navigation
//
//  Created by Sergey on 15.04.2022.
//

import UIKit

class DetailPhotoViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.enableZoom()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var backView: UIView = {
        let backView = UIView()
        backView.alpha = 0
        backView.backgroundColor = .black
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "multiply.circle.fill")
        button.setBackgroundImage(image, for: .normal)
        button.alpha = 0
        button.tintColor = .white
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.tapGestureRecognizer.addTarget(self, action: #selector(didTapButton))
        self.imageView.addGestureRecognizer(self.tapGestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupView() {
     
        self.view.addSubview(self.backView)
        self.view.addSubview(self.imageView)
        self.view.addSubview(self.closeButton)

        let backViewTopConstraint = self.backView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let backViewLeadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let backViewTrailinConstraint = self.backView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let backViewBottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    
        let imageWidthConstraint = self.imageView.widthAnchor.constraint(equalToConstant: self.view.bounds.width)
        let imageHeightConstraint = self.imageView.heightAnchor.constraint(equalToConstant: self.view.bounds.height)
        let imageXConstraint = self.imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let imageYConstraint = self.imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        let buttonTopConstraint = self.closeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 25)
        let buttonTrailingConstraint = self.closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)
        let buttonHeightConstraint = self.closeButton.heightAnchor.constraint(equalToConstant: 40)
        let buttonWidthConstraint = self.closeButton.widthAnchor.constraint(equalToConstant: 40)

        NSLayoutConstraint.activate([backViewTopConstraint, backViewLeadingConstraint,backViewTrailinConstraint, backViewBottomConstraint, imageWidthConstraint, imageHeightConstraint, imageXConstraint, imageYConstraint, buttonTopConstraint, buttonTrailingConstraint, buttonHeightConstraint, buttonWidthConstraint ])
        
        UIView.animate(withDuration: 0.5) {
            self.backView.alpha = 0.8
            self.view.layoutIfNeeded()
        } completion: { _ in }
        
        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.closeButton.alpha = 1
            self.view.layoutIfNeeded()
        } completion: { _ in }
    }
    
    private func hideSelf(content: UIViewController) {
        content.willMove(toParent: nil)
        content.view.removeFromSuperview()
        content.removeFromParent()
    }
        
    @objc private func didTapButton() {
        self.hideSelf(content: self)
        UIView.animate(withDuration: 0.5) {
            self.backView.alpha = 0.8
            self.view.layoutIfNeeded()
        }

        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.closeButton.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
}

extension UIImageView {
  func enableZoom() {
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
    isUserInteractionEnabled = true
    addGestureRecognizer(pinchGesture)
  }

  @objc private func startZooming(_ sender: UIPinchGestureRecognizer) {
    let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
    guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
    sender.view?.transform = scale
    sender.scale = 1
  }
}
