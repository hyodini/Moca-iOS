//
//  CommunityContentVC.swift
//  Moca-iOS
//
//  Created by 박세은 on 2018. 12. 26..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class CommunityContentVC: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var cotentTableView: UITableView!
    
    @IBOutlet weak var textBackgroundView: UIView!
    @IBOutlet weak var textSquareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpListView()
        setUpView()
    }
    
    private func setUpView() {
        textSquareView.applyBorder(width: 0.5, color: #colorLiteral(red: 0.8469749093, green: 0.8471175432, blue: 0.8469561338, alpha: 1))
        textBackgroundView.applyRadius(radius: 39/2)
    }
    
    private func setUpListView() {
//        let gesture = UIPanGestureRecognizer(target: self, action: Selector(("wasDragged:")))
//        cotentTableView.addGestureRecognizer(gesture)
//        cotentTableView.isUserInteractionEnabled = true
//        gesture.delegate = self
//        
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        
        cotentTableView.delegate = self
        cotentTableView.dataSource = self
        cotentTableView.applyRadius(radius: 10)
    }
    
    func wasDragged(gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizer.State.began || gestureRecognizer.state == UIGestureRecognizer.State.changed {
            let translation = gestureRecognizer.translation(in: self.view)
            print(gestureRecognizer.view!.center.y)
            if(gestureRecognizer.view!.center.y < 462) {
                gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x, y: gestureRecognizer.view!.center.y + translation.y)
            }else {
                gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x, y: 554)
            }
            
            gestureRecognizer.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
        }
        
    }
}

extension CommunityContentVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "CommunityContentImageCell", for: indexPath) as! CommunityContentImageCell
        return cell
    }
    
}

extension CommunityContentVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = cotentTableView.dequeueReusableCell(withIdentifier: "CommunityContentCell") as! CommunityContentCell
            return cell
        } else {
            let cell = cotentTableView.dequeueReusableCell(withIdentifier: "CommunityCommentCell") as! CommunityCommentCell
            return cell
        }
    }
    
    
}
