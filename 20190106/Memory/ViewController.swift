//
//  ViewController.swift
//  Memory
//
//  Created by Cory Steers on 1/11/19.
//  Copyright © 2019 Cory Steers. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let dataSource = MemoryDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MemoryViewController") as? MemoryViewController else {
            fatalError("unable to instantiate memory view controller!")
        }

        vc.item = dataSource.getItem(at: indexPath.row)

        navigationController?.pushViewController(vc, animated: true)
    }
}
