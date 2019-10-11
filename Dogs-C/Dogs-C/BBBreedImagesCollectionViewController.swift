//
//  BBBreedImagesCollectionViewController.swift
//  Dogs-C
//
//  Created by Bethany Wride on 10/10/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

import UIKit

private let reuseIdentifier = "imageCell"

class BBBreedImagesCollectionViewController: UICollectionViewController {
    
    // Receiver for breed and subbreed (SubbreedTableViewController will send both the breed and subbreed)
    var breed: BBBreed?
    
    // Receiver for subbreed
    var subbreed: BBSubbreed?
    
    // Local source of truth
    var imageURLS: [Any] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDataSource
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLS.count
//        if subbreed != nil {
//            guard let subbreed = subbreed else { return 0 }
//            return subbreed.imageURLs.count
//        } else {
//            guard let breed = breed else {return 0}
//            return breed.imageURLs.count
//        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let imageURL = imageURLS[indexPath.row]
//        BBBreedController.sharedInstance().fetchImageData(from: URL(string: imageURL)) { (data) in
//
//        }
        return cell
    }
    
    func fetchImageURLS() {
        if subbreed != nil {
            guard let subbreed = subbreed else { return }
            guard let breed = breed else { return }
            BBBreedController.sharedInstance().fetchSubbreedImageURL(subbreed, breed: breed) { (imagesURLs) in
                DispatchQueue.main.async {
                    subbreed.imageURLs = imagesURLs
                    self.collectionView.reloadData()
                }
            }
        } else {
            guard let breed = breed else { return }
            BBBreedController.sharedInstance().fetchBreedImageURL(breed) { (imagesURLs) in
                DispatchQueue.main.async {
                    self.imageURLS = imagesURLs
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

