//
//  PostViewController.swift
//  Navigation
//
//  Created by Sergey on 28.03.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    lazy var post = Post()
        
    private lazy var infoButton = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(clickButton))
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        return table
    }()
    
    private func setupView() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Post"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.createTable()
    }
    
    override func viewDidLoad() {
        setupView()
        self.navigationItem.rightBarButtonItem = infoButton
    }
    
    private func createTable() {
        self.view.addSubview(self.tableView)
        
        let tableViewTopConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let tableViewLeadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let tableViewTrailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let tableViewBottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([
            tableViewTopConstraint,
            tableViewLeadingConstraint,
            tableViewTrailingConstraint,
            tableViewBottomConstraint
        ])
    }

    @objc private func clickButton() {  // Действие кнопки
        let infoViewController = InfoViewController()   // Создаем InfoViewController
        infoViewController.modalPresentationStyle = .automatic  //  должен показаться модально
        present(infoViewController, animated: true, completion: nil) // Вызываем InfoViewController
    }
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        cell.titleLabel.text = self.post.title
        cell.postImageView.image = UIImage(named: self.post.image)
        cell.descLabel.text = self.post.description
        cell.authorLabel.text = "Автор: " + self.post.author
        cell.likesCounterLabel.text = String(self.post.likes)
        cell.viewesCounterLabel.text = String(self.post.views)
        return cell
    }
}
