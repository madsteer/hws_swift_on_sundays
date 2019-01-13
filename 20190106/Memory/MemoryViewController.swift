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
    let visibleText: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Georgia", size: 28)!,
        .foregroundColor: UIColor.black
    ]
    let invisibleText: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Georgia", size: 28)!,
        .foregroundColor: UIColor.clear,
        .strikethroughStyle: 1,
        .strikethroughColor: UIColor.black
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(item != nil, "you must provide a memory item before trying to show this view controller")
        textView.attributedText = showText(for: item)

        let tappRecognizer = UITapGestureRecognizer(target: self, action: #selector(wordsTapped))
        textView.addGestureRecognizer(tappRecognizer)
    }

    func showText(for item: MemoryItem) -> NSMutableAttributedString {
        let words = item.text.components(separatedBy: " ")
        let output = NSMutableAttributedString()
        let space = NSAttributedString(string: " ", attributes: visibleText)

        for (index, word) in words.enumerated() {
            let attributedWord: NSAttributedString
            var attributedPunctuation: NSAttributedString?
            if index < blankCounter {
                attributedWord = NSAttributedString(string: word, attributes: visibleText)
            } else {
                var strippedWord = word
                var punctuation: String?

                if ".,".contains(word.last!) {
                    punctuation = String(strippedWord.removeLast())
                }
                attributedWord = NSAttributedString(string: strippedWord, attributes: invisibleText)
                if let symbol = punctuation {
                    attributedPunctuation = NSAttributedString(string: symbol, attributes: visibleText)
                }
            }
            output.append(attributedWord)
            if let ap = attributedPunctuation {
                output.append(ap)
            }
            output.append(space)
        }
        return output
    }

    @objc func wordsTapped() {
        blankCounter += 1
        textView.attributedText = showText(for: item)
    }
}
