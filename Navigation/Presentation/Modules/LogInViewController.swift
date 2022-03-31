//
//  LogInViewController.swift
//  Navigation
//
//  Created by Sergey on 30.03.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
 
    private lazy var contentView: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()

    private lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var logo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFit
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()



    private lazy var login: UITextField = {
        let login = UITextField()
        login.backgroundColor = .systemGray6
        login.layer.borderWidth = 0.5
        login.layer.borderColor = UIColor.lightGray.cgColor
        login.layer.cornerRadius = 10
        login.textColor = .black
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
        login.leftViewMode = .always
        login.textAlignment = .left
        login.font = UIFont(name: "Helvetica-Regular", size: 16)
        login.placeholder = "Email or phone"
        login.translatesAutoresizingMaskIntoConstraints = false
        login.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return login
    }()

    private lazy var password: UITextField = {
        let pass = UITextField()
        pass.backgroundColor = .systemGray6
        pass.layer.borderWidth = 0.5
        pass.layer.borderColor = UIColor.lightGray.cgColor
        pass.layer.cornerRadius = 10
        pass.textColor = .black
        pass.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: pass.frame.height))
        pass.leftViewMode = .always
        pass.textAlignment = .left
        pass.font = UIFont(name: "Helvetica-Regular", size: 16)
        pass.placeholder = "Password"
        pass.isSecureTextEntry = true
        pass.translatesAutoresizingMaskIntoConstraints = false
        pass.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return pass
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = UIColor(named: "MyColor")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)

        return button
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.setupView()
        self.setupConstraints()
    }

    private func setupView(){
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.mainStack)
        self.mainStack.addArrangedSubview(self.logo)
        self.mainStack.addArrangedSubview(self.login)
        self.mainStack.addArrangedSubview(self.password)
        self.mainStack.addArrangedSubview(self.loginButton)
    }

    private func setupConstraints() {
        
        //scrollView
        let scrollViewTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let scrollViewLeadingConstraint = self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let scrollViewTrailingConstraint = self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let scrollViewBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        //contentView
        let contentViewTopConstraint = self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        let contentViewLeadingConstraint = self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16)
        let contentViewTrailingtConstraint = self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -16)
        let contentViewBottomConstraint = self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        let contentViewCenterXConstraint = self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        
        //mainStack
        let mainStackTopConstraint = self.mainStack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120)
        let mainStackLeadingConstraint = self.mainStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let mainStackTrailingConstraint = self.mainStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let mainStackBottomConstraint = self.mainStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        let mainStackCenterXConstraint = self.mainStack.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        
        //logo
        let logoTopConstraint = self.logo.topAnchor.constraint(equalTo: self.mainStack.topAnchor)
        let logoWidthConstraint = self.logo.widthAnchor.constraint(equalToConstant: 100)
        let logoHeightConstraint = self.logo.heightAnchor.constraint(equalToConstant: 100)
        
        //login
        let loginTopConstraint = self.login.topAnchor.constraint(equalTo: self.logo.bottomAnchor, constant: 120)
        let loginLeadingConstraint = self.login.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let loginTrailingConstraint = self.login.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let loginHeightConstraint = self.login.heightAnchor.constraint(equalToConstant: 50)
        
        //password
        let passwordTopConstraint = self.password.topAnchor.constraint(equalTo: self.login.bottomAnchor)
        let passwordLeadingConstraint = self.password.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let passwordTrailingConstraint = self.password.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let passwordHeightConstraint = self.password.heightAnchor.constraint(equalToConstant: 50)
        
        //loginButton
        let loginButtonTopConstraint = self.loginButton.topAnchor.constraint(equalTo: self.password.bottomAnchor, constant: 16)
        let loginButtonHeightConstraint = self.loginButton.heightAnchor.constraint(equalToConstant: 50)
        let loginButtonWidthConstraint = self.loginButton.widthAnchor.constraint(equalTo: self.password.widthAnchor)
        
        //contraints activation
        NSLayoutConstraint.activate([
            scrollViewTopConstraint,
            scrollViewLeadingConstraint,
            scrollViewBottomConstraint,
            scrollViewTrailingConstraint,
            
            contentViewTopConstraint,
            contentViewLeadingConstraint,
            contentViewTrailingtConstraint,
            contentViewBottomConstraint,
            contentViewCenterXConstraint,
            
            mainStackTopConstraint,
            mainStackLeadingConstraint,
            mainStackTrailingConstraint,
            mainStackBottomConstraint,
            mainStackCenterXConstraint,
            
            logoTopConstraint,
            logoWidthConstraint,
            logoHeightConstraint,
            
            loginTopConstraint,
            loginLeadingConstraint,
            loginTrailingConstraint,
            loginHeightConstraint,
            
            passwordTopConstraint,
            passwordLeadingConstraint,
            passwordTrailingConstraint,
            passwordHeightConstraint,
            
            loginButtonTopConstraint,
            loginButtonHeightConstraint,
            loginButtonWidthConstraint].compactMap({$0}))

        }
    
    @objc private func goToProfile(){
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }

}//END
