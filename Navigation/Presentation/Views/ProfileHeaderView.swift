//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Sergey on 28.03.2022.
//

import UIKit

final class ProfileHeaderView: UIView {

    // Аватар
        private lazy var avatarImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "hell_cat")
            imageView.layer.borderWidth = 3.0
            imageView.layer.masksToBounds = false
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.cornerRadius = 45
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        // Строка с именем пользователя
        private lazy var fullNameLabel: UILabel = {
            let label = UILabel()
            label.text = "Hell Cat"
            label.textColor = .black
            label.font = UIFont(name: "Helvetica-Bold", size: 18)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        // Строка статуса
        private lazy var statusLabel: UILabel = {
            let label = UILabel()
            label.text = "Rocking!"
            label.textColor = .gray
            label.font = UIFont(name: "Helvetica-Regular", size: 14)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        // Кнопка изменения статуса
        private lazy var setStatusButton: UIButton = {
            let button = UIButton()
            button.setTitle("Show status", for: .normal)
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
        
        // Вертикальный стек для строк имени пользователя и статуса
        private lazy var labelStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.spacing = 10
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        // Горизонтальный стек для аватара и лейблов
        private lazy var infoStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 20
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        // Верхний констрейнт для кнопки
        private var buttonTopConstraint: NSLayoutConstraint?
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.drawSelf()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // Отображение себя
        private func drawSelf() {
            self.addSubview(self.infoStackView)// добавляем на вью гориз. стек
            self.addSubview(self.setStatusButton)// добавляем на вью кнопку изменения статуса
            self.infoStackView.addArrangedSubview(avatarImageView)// добавляем аватар в горизонтальный стек
            self.infoStackView.addArrangedSubview(labelStackView)// добавляем вертикальный стек в горизонтальный стек
            self.labelStackView.addArrangedSubview(fullNameLabel)// добавляем имя пользователя в вертикальный стек
            self.labelStackView.addArrangedSubview(statusLabel)// добавляем статус в вертикальный стек
            
            // констрейнты
            let topConstraint = self.infoStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
            let leadingConstraint = self.infoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
            let trailingConstraint = self.infoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
            
            let imageViewAspectRatio = self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 1.0)
            
            self.buttonTopConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 16)
            self.buttonTopConstraint?.priority = UILayoutPriority(rawValue: 999)
            
            let buttonLeadingConstraint = self.setStatusButton.leadingAnchor.constraint(equalTo: self.infoStackView.leadingAnchor)
            let buttonTrailingConstraint = self.setStatusButton.trailingAnchor.constraint(equalTo: self.infoStackView.trailingAnchor)
            let buttonBottomConstraint = self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            let buttonHeightConstraint = self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
            
            NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, imageViewAspectRatio, self.buttonTopConstraint, buttonLeadingConstraint, buttonTrailingConstraint, buttonBottomConstraint, buttonHeightConstraint].compactMap({$0}))
        }
        
        @objc private func didTapStatusButton() {
            // если статус задан, то мы его выводим в консоль
            if let status = self.statusLabel.text {
                print(status)
            }
        }
}
