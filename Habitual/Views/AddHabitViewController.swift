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
    let habit_images = [UIImage(named: "outdoors")!]
    
    // MARK: - RETURN VALUES
    
    // MARK: - METHODS
    private func updateUI() {
        title = "Choose an Image"
    }
    
    // MARK: - IBACTIONS
    
    // MARK: - LIFE CYCLE
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
       collectionView.delegate = self
       collectionView.dataSource = self
        
        collectionView.register(HabitImageCollectionViewCell.nib,
                                forCellWithReuseIdentifier: HabitImageCollectionViewCell.identifier)
    }
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

        cell.setImage(image: habit_images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return habit_images.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
    
}

