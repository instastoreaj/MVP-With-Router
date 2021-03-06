//
//  UsersVC+TableView.swift
//  MVP-With-Router
//
//  Created by Alex  on 6/27/21.
//  Copyright © 2021 Alex. All rights reserved.
//

import Foundation
import UIKit

extension UsersViewController: UITableViewDataSource {
    
    
    func setupTableView() {
        // confirm to data source protocol
        tableView.dataSource = self
        tableView.delegate = self
        
        // create nib file
        let nibFile = UINib(nibName: "UsersViewCell", bundle: nil)
        tableView.register(nibFile, forCellReuseIdentifier: cellIdentifier)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UsersViewCell
        
        // configure cell...
        presenter.displayData(for: cell, in: indexPath.row)
        
        return cell
    }

}

// MARK: - Table View Delegate

extension UsersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(in: indexPath.row)
    }
}
