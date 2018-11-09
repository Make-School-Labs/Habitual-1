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
    let habit_images = [UIImage].init(repeating: UIImage(named: "outdoors")!, count: 12)
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pickPhotoButton: UIButton!
    // MARK: - RETURN VALUES
    
    // MARK: - METHODS
    private func updateUI() {
        title = "Choose an Image"
    }
    
    // MARK: - IBACTIONS
    
    
    @IBAction func pickPhotoButtonPressed(_ sender: Any) {
        guard let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first else {return}
        let confirmHabitVC = ConfirmHabitViewController.instantiate()
        confirmHabitVC.habitImage = habit_images[selectedIndexPath.row]
        navigationController?.pushViewController(confirmHabitVC, animated: true)
     
    }
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
       collectionView.delegate = self
       collectionView.dataSource = self
       collectionView.register(HabitImageCollectionViewCell.nib,
                                forCellWithReuseIdentifier: HabitImageCollectionViewCell.identifier)
       collectionView.allowsMultipleSelection = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
    
}

// MARK: - CollectionView Delegate Methods
extension AddHabitViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
 
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: collectionViewWidth/4, height: collectionViewWidth/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 2.0
        cell?.layer.borderColor = UIColor.yellow.cgColor
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0.0
    }
    
    
    
}

