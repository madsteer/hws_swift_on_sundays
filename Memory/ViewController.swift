//
//  ViewController.swift
//  Memory
//
//  Created by Cory Steers on 1/11/19.
//  Copyright © 2019 Cory Steers. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var items = [MemoryItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadItems()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.text

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MemoryViewController") as? MemoryViewController else {
            fatalError("unable to instantiate memory view controller!")
        }

        vc.item = items[indexPath.row]

        navigationController?.pushViewController(vc, animated: true)

    }

    func loadItems() {
        guard let url = Bundle.main.url(forResource: "items", withExtension: "json") else {
            fatalError("can't find json file!")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("can't load json file!")
        }

        let decoder = JSONDecoder()

        guard let savedItems = try? decoder.decode([MemoryItem].self, from: data) else {
            fatalError("can't decode json data!")
        }

        items = savedItems
    }
}

