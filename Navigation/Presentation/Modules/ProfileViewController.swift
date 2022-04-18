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
        let table = UITableView(frame: .zero, style: .grouped)
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
        self.createTable()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
        
    private func createTable() {
        self.view.addSubview(self.tableView)
//        self.tableView.contentInsetAdjustmentBehavior = .never
        
        let tableViewTopConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
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
        if section == 0 {
            return 1
        } else {
            return self.data.count}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            cell.post = self.data[indexPath.row]
            cell.titleLabel.text = cell.post.title
            cell.postImageView.image = UIImage(named: cell.post.image)
            cell.descLabel.text = cell.post.description
            cell.authorLabel.text = "Автор: " + cell.post.author
            cell.likesCounterLabel.text = String(cell.post.likes)
            cell.viewesCounterLabel.text = String(cell.post.views)
            return cell
        }
    }
    
    //MARK: - UITableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = ProfileHeaderView()
            headerView.backgroundColor = .systemGray5
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photoVC = PhotosViewController()
            self.navigationController?.pushViewController(photoVC, animated: true)
        } else {
            let postVC = PostViewController(post: data[indexPath.row])
            self.navigationController?.pushViewController(postVC, animated: true)
        }
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


