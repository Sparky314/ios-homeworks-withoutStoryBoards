//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Sergey on 01.04.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 20, weight: .bold)
        title.textColor = .black
        title.numberOfLines = 2
        return title
    }()
    
    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        return imageView
    }()
    
    lazy var descLabel: UILabel = {
        let desc = UILabel()
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.font = .systemFont(ofSize: 14)
        desc.textColor = .systemGray
        desc.numberOfLines = 0
        return desc
    }()
    
    lazy var authorLabel: UILabel = {
        let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.font = .systemFont(ofSize: 14, weight: .semibold)
        author.textColor = UIColor(named: "MyColor")
        return author
    }()
    
    private lazy var contersStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var likesContersStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var likesIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "hand.thumbsup.fill")
        imageView.tintColor = .black
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    lazy var likesCounterLabel: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.font = .systemFont(ofSize: 16)
        likes.textColor = .black
        return likes
    }()
    
    private var isLiked: Bool = false
    
    private var likeTapGesture = UITapGestureRecognizer()
    
    private lazy var viewsContersStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var viewsIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "eye.fill")
        imageView.tintColor = .black
        return imageView
    }()
    
    lazy var viewesCounterLabel: UILabel = {
        let viewes = UILabel()
        viewes.translatesAutoresizingMaskIntoConstraints = false
        viewes.font = .systemFont(ofSize: 16)
        viewes.textColor = .black
        return viewes
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupCell() {
        self.contentView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.titleLabel)
        self.stackView.addArrangedSubview(self.postImageView)
        self.stackView.addArrangedSubview(self.descLabel)
        self.stackView.addArrangedSubview(self.authorLabel)
        self.stackView.addArrangedSubview(self.contersStack)
        self.contersStack.addArrangedSubview(self.likesContersStack)
        self.likesContersStack.addArrangedSubview(self.likesIcon)
        self.likesContersStack.addArrangedSubview(self.likesCounterLabel)
        self.contersStack.addArrangedSubview(self.viewsContersStack)
        self.viewsContersStack.addArrangedSubview(self.viewsIcon)
        self.viewsContersStack.addArrangedSubview(self.viewesCounterLabel)
        
        let cellViewTopConstraint = self.stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16)
        let cellViewLeadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let cellViewTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        let cellViewBottomConstraint = self.stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)
        
        let imageViewWidthConstraint = self.postImageView.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        let imageViewHeightConstraint = self.postImageView.heightAnchor.constraint(equalTo: self.postImageView.widthAnchor)
        
        NSLayoutConstraint.activate([
            cellViewTopConstraint,
            cellViewLeadingConstraint,
            cellViewTrailingConstraint,
            cellViewBottomConstraint,
            imageViewWidthConstraint,
            imageViewHeightConstraint
        ])
        
        self.likeTapGesture.addTarget(self, action: #selector(didTapLike(_:)))
        self.likesIcon.addGestureRecognizer(self.likeTapGesture)
    }
    
    @objc private func didTapLike(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.likeTapGesture === gestureRecognizer else { return }
        let likesQty = Int(self.likesCounterLabel.text!)
        if isLiked {
            self.likesIcon.tintColor = .black
            self.likesCounterLabel.text = String(likesQty! - 1)
            self.isLiked.toggle()
        } else {
            self.likesIcon.tintColor = UIColor(named: "MyColor")
            self.likesCounterLabel.text = String(likesQty! + 1)
            self.isLiked.toggle()
        }
    }
}
