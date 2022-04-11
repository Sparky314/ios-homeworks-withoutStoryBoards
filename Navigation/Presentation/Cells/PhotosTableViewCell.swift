//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Sergey on 04.04.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var firstStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var secondStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var titlePhotos: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var arrow: UIButton = {
        let arrow = UIImage(named: "arrow.right")
        arrow?.withTintColor(.black)
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        button.setBackgroundImage(arrow, for: UIControl.State.normal)
        button.addTarget(self, action:#selector(arrowTapped), for: .touchUpInside)
        return button
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
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "ProfileHorizontalPhotosFeedCell")

            return collectionView
        }()
    
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//            super.init(style: style, reuseIdentifier: reuseIdentifier)
//            setupView()
//        }
//
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//
//        private func setupView() {
//            self.backgroundColor = .systemGray6
//            self.contentView.addSubview(self.backView)
//            self.backView.addSubview(self.stackView)
//            self.stackView.addArrangedSubview(self.photosLabel)
//            self.stackView.addArrangedSubview(self.arrowImage)
//            self.backView.addSubview(photoCollectionView)
//            activateConstraints()
//            for i in 0...19 {
//                if let image = UIImage(named: "cat\(i)") {
//                    images.append(image)
//                }
//        }
//        }
//
    
    private var smallPhoto: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var photos: [UIImageView] = {
        let arrayOfPfotos = [UIImageView]()
        return arrayOfPfotos
    }()
    
    
    @objc private func arrowTapped() {
        
    }

}

//extension PhotosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return images.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
//            let image = images[indexPath.item]
//            cell.photoImageView.image = image
//
//            return cell
//        }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
//            return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
//        }
//}
