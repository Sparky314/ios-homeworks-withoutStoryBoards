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
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        table.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        return table
    }()
    
    private var data = posts
            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.createTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
        
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Profile"
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

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            cell.titleLabel.text = self.data[indexPath.row - 1].title
            cell.postImageView.image = UIImage(named: self.data[indexPath.row - 1].image)
            cell.descLabel.text = self.data[indexPath.row - 1].description
            cell.authorLabel.text = "Автор: " + self.data[indexPath.row - 1].author
            cell.likesCounterLabel.text = String(self.data[indexPath.row - 1].likes)
            cell.viewesCounterLabel.text = String(self.data[indexPath.row - 1].views)
            return cell
        }
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 246
        }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = ProfileHeaderView()
        headerView.backgroundColor = .systemGray5
        headerView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let photoVC = PhotosViewController()
            self.navigationController?.pushViewController(photoVC, animated: true)
        } else {
            let postVC = PostViewController()
            postVC.post = data[indexPath.row - 1]
            self.navigationController?.pushViewController(postVC, animated: true)
        }
    }
    
}


