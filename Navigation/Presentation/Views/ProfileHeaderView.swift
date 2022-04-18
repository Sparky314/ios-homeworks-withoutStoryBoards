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
            imageView.layer.masksToBounds = false
            imageView.layer.borderWidth = 3.0
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.cornerRadius = 50
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
            label.text = statusText
            label.textColor = .darkGray
            label.font = UIFont(name: "Helvetica-Regular", size: 14)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        // Поле ввода текста
        private lazy var textField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Set the status"
            textField.backgroundColor = .white
            textField.font = UIFont(name: "Helvetica-Regular", size: 14)
            textField.textColor = .black
            textField.layer.cornerRadius = 12
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.black.cgColor
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
            textField.leftViewMode = .always
            textField.textAlignment = .left
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.addTarget(self, action: #selector(self.statusTextChanged), for: .editingChanged)
            return textField
        }()
        
        private lazy var statusText: String = "Rocking!"
    

        // Кнопка изменения статуса
        private lazy var setStatusButton: UIButton = {
            let button = UIButton()
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 4
            button.layer.shadowOpacity = 0.7
            button.layer.shadowOffset = CGSize(width: 4, height: 4)
            button.layer.shadowRadius = 4
            button.addTarget(self, action: #selector(self.didTapStatusButton), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Set status", for: .normal)
            return button
        }()
        
        // Вертикальный стек для строк имени пользователя и статуса
        private lazy var labelStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.spacing = 30
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        // Горизонтальный стек для аватара и лейблов
        private lazy var infoStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 16
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
                 
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.textField.delegate = self //чтобы закрывать клавиатуру нажатием return
            // создаём жест, чтобы закрывать клавиатуру при нажатии за её пределами, но в пределах самого ProfileHeaderView
            let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
            tap.cancelsTouchesInView = false
            self.addGestureRecognizer(tap)
            self.drawSelf()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // Отображение себя
        private func drawSelf() {
            self.addSubview(self.infoStackView)// добавляем на вью гориз. стек
            self.addSubview(self.textField)
            self.addSubview(self.setStatusButton)// добавляем на вью кнопку изменения статуса
            self.infoStackView.addArrangedSubview(self.avatarImageView)// добавляем аватар в горизонтальный стек
            self.infoStackView.addArrangedSubview(self.labelStackView)// добавляем вертикальный стек в горизонтальный стек
            self.labelStackView.addArrangedSubview(self.fullNameLabel)// добавляем имя пользователя в вертикальный стек
            self.labelStackView.addArrangedSubview(self.statusLabel)// добавляем статус в вертикальный стек
            
            // констрейнты
            
            let stackViewTopConstraint = self.infoStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
            let stackViewLeadingConstraint = self.infoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
            let stackViewTrailingConstraint = self.infoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)

            let avatarImageViewWidthConstraint = self.avatarImageView.widthAnchor.constraint(equalToConstant: 100)
            let avatarImageViewHeightConstraint = self.avatarImageView.heightAnchor.constraint(equalToConstant: 100)

            let buttonTopConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 16)
            let buttonLeadingConstraint = self.setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
            let buttonTrailingConstraint = self.setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
            let buttonHeightConstraint = self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
            let buttonBottomConstraint = self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)

            let topTextFieldConstraint = self.textField.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 10)
            let leadingTextFieldConstraint = self.textField.leadingAnchor.constraint(equalTo: self.labelStackView.leadingAnchor)
            let heightTextFieldConstraint = self.textField.heightAnchor.constraint(equalToConstant: 40)
            let trailingTextFieldConstraint = self.textField.trailingAnchor.constraint(equalTo: self.labelStackView.trailingAnchor)

            NSLayoutConstraint.activate([ stackViewTopConstraint, stackViewLeadingConstraint, stackViewTrailingConstraint, avatarImageViewWidthConstraint, avatarImageViewHeightConstraint, buttonTopConstraint, buttonLeadingConstraint, buttonTrailingConstraint,  buttonHeightConstraint, buttonBottomConstraint, topTextFieldConstraint, leadingTextFieldConstraint, heightTextFieldConstraint, trailingTextFieldConstraint])
        }
    
    // функция для внесения текста из текстового поля в лейбл статуса
    @objc func statusTextChanged(_ textField: UITextField) {
        if var text = textField.text {
            switch text {
            case "": break
            default:
                let firstChar = text[text.startIndex]
                switch firstChar {
                    case " ":
                        text = rmSpace(text: text)
                        if text.isEmpty {
                            break
                        } else {
                            fallthrough
                        }
                    default: self.statusText = text
                }
            }
        }
    }
    
    // функция для удаления пробелов в начале строки
    func rmSpace(text: String) -> String {
        var clipText = text
        repeat {
           clipText.remove(at: clipText.startIndex)
        } while !clipText.isEmpty && clipText[clipText.startIndex] == " "
        return clipText
    }
        
    @objc private func didTapStatusButton() {
        self.textField.becomeFirstResponder()
        self.setStatusButton.setTitle("Set status", for: .normal)
        guard textField.text != "" else {
            textField.vibrate()
            return
        }
        self.statusLabel.text = statusText
        self.textField.text = ""
        self.endEditing(true)
    }
}

extension ProfileHeaderView: UITextFieldDelegate {
    // закрывает клавиатуру  и устанавливает статус при нажатии на return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.didTapStatusButton()
        textField.resignFirstResponder()
        return true
    }
}

extension UIView {
    func vibrate() {
    let animation = CABasicAnimation(keyPath: "position")
    animation.duration = 0.05
    animation.repeatCount = 5
    animation.autoreverses = true
    animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5.0, y: self.center.y))
    animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5.0, y: self.center.y))
    layer.add(animation, forKey: "position")
    }
}
