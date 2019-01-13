//
//  MemoryDataSource.swift
//  Memory
//
//  Created by Cory Steers on 1/13/19.
//  Copyright © 2019 Cory Steers. All rights reserved.
//

import UIKit

class MemoryDataSource: NSObject, UITableViewDataSource {
    var items = [MemoryItem]()

    override init() {
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.text

        return cell
    }

    func getItem(at index: Int) -> MemoryItem {
        return items[index]
    }
}
