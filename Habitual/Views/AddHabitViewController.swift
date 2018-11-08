//
//  AddHabitViewController.swift
//  Habitual
//
//  Created by Noah Woodward on 11/08/18.
//  Copyright © 2018 Noah Woodward. All rights reserved.
//

import UIKit

class AddHabitViewController: UIViewController{
    
    // MARK: - VARS
    let habbit_images = [UIImage(named: "outdoors")]
    
    // MARK: - RETURN VALUES
    
    // MARK: - METHODS
    private func updateUI() {
        title = "Choose an Image"
    }
    
    // MARK: - IBACTIONS
    
    // MARK: - LIFE CYCLE
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
    
}

// MARK: - CollectionView Delegate Methods
extension AddHabitViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HabitImageCollectionViewCell.identifier,
            for: indexPath
            ) as! HabitImageCollectionViewCell
        
        cell.setImage(habbit_images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return habbit_images.count
    }
    
    
    
}

