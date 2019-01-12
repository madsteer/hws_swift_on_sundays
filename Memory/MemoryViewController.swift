//
//  MemoryViewController.swift
//  Memory
//
//  Created by Cory Steers on 1/11/19.
//  Copyright © 2019 Cory Steers. All rights reserved.
//

import UIKit

class MemoryViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    var item: MemoryItem!
    var blankCounter = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(item != nil, "you must provide a memory item before trying to show this view controller")
        showText()

        let tappRecognizer = UITapGestureRecognizer(target: self, action: #selector(wordsTapped))
        textView.addGestureRecognizer(tappRecognizer)
    }

    func showText() {
        let words = item.text.components(separatedBy: " ")
        var output = ""

        for (index, word) in words.enumerated() {
            if index < blankCounter {
                output += "\(word) "
            } else {
                let blanks = String(repeating: "_", count: word.count)
                output += "\(blanks) "
            }
        }
        textView.text = output
    }

    @objc func wordsTapped() {
        blankCounter += 1
        showText()
    }
}
