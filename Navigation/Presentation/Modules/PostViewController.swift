//
//  PostViewController.swift
//  Navigation
//
//  Created by Sergey on 28.03.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var post = Post(title: "", author:  "", description: "", image: "", likes: 0, views: 0)
    
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
    
    init(post: Post) {
        super.init(nibName: nil, bundle: nil)
        self.post = post
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
        self.post.views += 1
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
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        cell.post = self.post
        cell.titleLabel.text = cell.post.title
        cell.postImageView.image = UIImage(named: cell.post.image)
        cell.descLabel.text = cell.post.description
        cell.authorLabel.text = "Автор: " + cell.post.author
        cell.likesCounterLabel.text = String(cell.post.likes)
        cell.viewesCounterLabel.text = String(cell.post.views)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let myCell = cell as? PostTableViewCell {
            if myCell.post.isLiked {
                myCell.likesIcon.tintColor = UIColor(named: "MyColor")
                myCell.likesCounterLabel.textColor = UIColor(named: "MyColor")
            } else {
                myCell.likesIcon.tintColor = .black
                myCell.likesCounterLabel.textColor = .black
            }
        }
    }
}
