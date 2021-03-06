//
//  CommunityReviewWrittingVC.swift
//  Moca-iOS
//
//  Created by 박세은 on 2018. 12. 27..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class CommunityReviewWrittingVC: UIViewController {

    @IBOutlet weak var writtingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        writtingTableView.delegate = self
        writtingTableView.dataSource = self
    }
}

extension CommunityReviewWrittingVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = writtingTableView.dequeueReusableCell(withIdentifier: "ReviewWrittingCell") as! ReviewWrittingCell
        return cell
    }
    
    
}
