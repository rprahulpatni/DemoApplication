//
//  ViewController+TableView.swift
//  IOS_Test_RahulPatni
//
//  Created by Neosoft on 16/06/21.
//

import Foundation
import UIKit

//==================================================
// MARK:- UITableViewDataSource
//==================================================
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return self.arrFilter.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            //For CollectionView
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderTVCell
            return cell
        } else{
            //For Listing
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListTVCell
            let data = self.arrFilter[indexPath.row]
            cell.configure(data: data)
            return cell
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            return searchBar
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 250
        }
        return 100
    }
}
