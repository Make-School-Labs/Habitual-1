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
    
    let habitImages = Habit.Images.allCases
    
    // MARK: - RETURN VALUES
    
    // MARK: - METHODS
    
    
    // MARK: - IBACTIONS
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pickPhotoButton: UIButton!
    
    @IBAction func pickPhotoButtonPressed(_ sender: Any) {
        guard let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first else {return}
        let confirmHabitVC = ConfirmHabitViewController.instantiate()
        confirmHabitVC.habitImage = habitImages[selectedIndexPath.row]
        navigationController?.pushViewController(confirmHabitVC, animated: true)
    }
    
    // MARK: - Navigation Bar Code
    
    func setupNavBar() {
        title = "Select Image"
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAddHabit(_:)))
        navigationItem.leftBarButtonItem = cancelButton
        
    }
    
    @objc func cancelAddHabit(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
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
        setupNavBar()
        
    }
}

// MARK: - CollectionView Delegate Methods
extension AddHabitViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HabitImageCollectionViewCell.identifier,
            for: indexPath
            ) as! HabitImageCollectionViewCell

        cell.setImage(image: habitImages[indexPath.row].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return habitImages.count
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

