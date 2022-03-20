//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Sergey on 20.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hell_cat")
        imageView.layer.borderWidth = 3.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 75
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = true
        return imageView
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 40
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hell Cat"
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Rocking"
        label.textColor = .gray
        label.font = UIFont(name: "Helvetica-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.isHidden = true
        textField.backgroundColor = .white
        textField.font = UIFont(name: "Helvetica-Regular", size: 15)
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        textField.clearButtonMode = .whileEditing // Кнопка «Очистить» при редактировании
         textField.clearButtonMode = .unlessEditing // не появляется во время редактирования, кнопка редактирования появляется после редактирования
         textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.setTitle("Set status", for: .selected)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.addTarget(self, action: #selector(self.didTapStatusButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    private var buttonTopConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawSelf() {
        self.addSubview(stackView)
        self.addSubview(textField)
        self.addSubview(setStatusButton)
    
        self.stackView.addArrangedSubview(avatarImageView)
        self.stackView.addArrangedSubview(labelStackView)
        self.labelStackView.addArrangedSubview(fullNameLabel)
        self.labelStackView.addArrangedSubview(statusLabel)
        
        let stackViewTopConstraint = self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        let stackViewLeadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let stackViewTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let avatarImageViewRatioConstraint = self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 1.0)
        
        self.buttonTopConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16)
        self.buttonTopConstraint?.priority = UILayoutPriority(rawValue: 999)
        
        let buttonLeadingConstraint = self.setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let buttonTrailingConstraint = self.setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let buttonHeightConstraint = self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        let buttonBottomConstraint = self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        NSLayoutConstraint.activate([stackViewTopConstraint, stackViewLeadingConstraint, stackViewTrailingConstraint, avatarImageViewRatioConstraint, self.buttonTopConstraint, buttonLeadingConstraint, buttonTrailingConstraint, buttonHeightConstraint, buttonBottomConstraint].compactMap({$0}))
    }
    
    @objc private func didTapStatusButton() {
        if let status = self.statusLabel.text {
            print(status)
        }
    }
}
