//
//  POIViewController.swift
//  LittlePink
//
//  Created by 竣亦 on 2022/4/30.
//

import UIKit

class POIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
}

extension POIViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension POIViewController: UITableViewDelegate {
    
}
