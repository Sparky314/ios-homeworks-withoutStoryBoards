//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Sergey on 04.04.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    lazy var images = PhotosViewController().gallery

    private enum Constant {
        static let itemCount: CGFloat = 4
    }

    private lazy var mainView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        return stack
    }()
        
    private lazy var titlePhotos: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
  
    private lazy var arrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.right")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.target(forAction: #selector(arrowTapped), withSender: nil)
        return imageView
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    
    private lazy var photoCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProfileHorizontalPhotosFeedCell.self, forCellWithReuseIdentifier: "ProfileHorizontalPhotosFeedCell")
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(arrowTapped))
        arrow.isUserInteractionEnabled = true
        arrow.addGestureRecognizer(tapGestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .systemGray6
        self.contentView.addSubview(self.mainView)
        self.mainView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.titlePhotos)
        self.stackView.addArrangedSubview(self.arrow)
        self.mainView.addSubview(photoCollectionView)
        activateConstraints()
    }

    private func activateConstraints() {
        let topConstraint = self.mainView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.mainView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.mainView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.mainView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)

        let stackViewTopConstraint = self.stackView.topAnchor.constraint(equalTo: self.mainView.topAnchor, constant: 12)
        let stackViewLeadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 12)
        let stackViewTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -12)

        let arrowYAnchor = self.arrow.centerYAnchor.constraint(equalTo: self.titlePhotos.centerYAnchor)

        let photoCollectionViewTopConstraint = self.photoCollectionView.topAnchor.constraint(equalTo: self.stackView.bottomAnchor)
        let photoCollectionViewLeadingConstraint = self.photoCollectionView.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 12)
        let photoCollectionViewTrailingConstraint = self.photoCollectionView.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -12)
        let photoCollectionViewConstraint = self.photoCollectionView.bottomAnchor.constraint(equalTo: self.mainView.bottomAnchor, constant: -12)
        let photoCollectionViewHeight = self.photoCollectionView.heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.25)

        NSLayoutConstraint.activate([topConstraint, leadingConstraint, bottomConstraint, trailingConstraint, stackViewTopConstraint, stackViewLeadingConstraint, stackViewTrailingConstraint,        photoCollectionViewTopConstraint, photoCollectionViewLeadingConstraint, photoCollectionViewTrailingConstraint, photoCollectionViewConstraint, photoCollectionViewHeight, arrowYAnchor])
    }
    
    func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize { // размеры ячейки
        let needWidth = width - 4 * spacing
        let itemWidth = floor(needWidth / Constant.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    @objc private func arrowTapped() {
        print("Arrow pressed!")
    }
}

extension PhotosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileHorizontalPhotosFeedCell", for: indexPath) as! ProfileHorizontalPhotosFeedCell
            let image = images[indexPath.item]
            cell.photoImageView.image = image
            return cell
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
            return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
        }
    
}
