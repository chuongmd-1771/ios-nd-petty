//
//  HomeViewController.swift
//  Petty
//
//  Created by chuongmd on 4/5/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit
import Reusable
import Firebase

final class HomeViewController: UIViewController {
    @IBOutlet private weak var newFeedCollectionView: UICollectionView!
    @IBOutlet private weak var popView: UIStackView!
    @IBOutlet private weak var tabbarView: UIView!
    
    private var posts = [Post]()
    private let imagePicker = UIImagePickerController()
    private let columnLayout = ColumnFlowLayout(cellsPerRow: 1,
                                                minimumInteritemSpacing: 30,
                                                minimumLineSpacing: 30,
                                                sectionInset: UIEdgeInsets(top: 30,
                                                                           left: 30,
                                                                           bottom: 30,
                                                                           right: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchUserPost()
        removeSubViewWhenTappedAround(subView: popView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction private func handleGotoUserDetail(_ sender: UIButton) {
        presentUserDetailController()
    }
    
    @IBAction private func handleAddImage(_ sender: UIButton) {
        if sender.tag == 0 {
            view.addSubview(popView)
            popView.translatesAutoresizingMaskIntoConstraints = false
            popView.bottomAnchor.constraint(equalTo: tabbarView.topAnchor, constant: 0).isActive = true
            popView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            view.addConstraintsWithFormat(format: "H:|[v0]|", views: popView)
            sender.tag = 1
        } else {
            popView.removeFromSuperview()
            sender.tag = 0
        }
    }
    
    @IBAction private func handleTakePictureFromCamera(_ sender: Any) {
        imagePicker.sourceType = .camera
        imagePicker.cameraCaptureMode = .photo
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
        popView.removeFromSuperview()
    }
    
    @IBAction private func handleChosePicTureFromLibrary(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
        popView.removeFromSuperview()
    }
    
    @IBAction private func resetViewToTop(_ sender: Any) {
        newFeedCollectionView.resetScrollPositionToTop()
        popView.removeFromSuperview()
    }
    
    @IBAction private func gotoInBoxScreen(_ sender: Any) {
        presentInBoxController()
    }
    
    private func setupCollectionView() {
        newFeedCollectionView.register(cellType: HomeNewFeedCell.self)
        newFeedCollectionView.collectionViewLayout = columnLayout
    }
    
    private func fetchUserPost() {
        Database.database().reference().child(Constant.posts).observe(.childAdded) { [weak self] (snapshot) in
            guard let self = self else { return }
            if let value = snapshot.value as? NSDictionary {
                guard let caption = value["caption"] as? String,
                    let image = value["imageUrl"] as? String,
                    let uid = value["id"] as? String
                    else { return }
                let post = Post(caption: caption, image: image, uid: uid)
                self.posts.insert(post, at: 0)
                
                DispatchQueue.main.async {
                    self.newFeedCollectionView.reloadData()
                }
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeNewFeedCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.roundCorner(color: .clear, cornerRadius: 30, shadowRadius: 10)
        cell.cellButtonTapAction = {
            self.presentUserDetailController()
        }
        cell.configure(with: posts[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        presentPetDetailController()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true)
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info[.editedImage] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originImage = info[.originalImage] as? UIImage {
            selectedImageFromPicker = originImage
        }
        if let selectedImage = selectedImageFromPicker {
            presentSharePhotoController(image: selectedImage)
        }
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

extension HomeViewController: StoryboardSceneBased, NibLoadable {
    static var sceneStoryboard = Storyboards.main
}
