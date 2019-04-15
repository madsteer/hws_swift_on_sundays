//
//  AppDelegate.swift
//  TextTransformer
//
//  Created by Cory Steers on 4/14/19.
//  Copyright © 2019 Cory Steers. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.title = "💩"
        statusItem.button?.target = self
        statusItem.button?.action = #selector(showSettings)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func showSettings() {
        let storyBoard = NSStoryboard(name: "Main" ,bundle: nil)
        guard let vc = storyBoard.instantiateController(withIdentifier: "ViewController") as? ViewController else {
            fatalError("Unable to find ViewController in the storyboard")
        }
        guard let button = statusItem.button else {
            fatalError("Couldn't find status item button.")
        }

        let popoverView = NSPopover()
        popoverView.contentViewController = vc
        popoverView.behavior = .transient // go away when you click away
        popoverView.show(relativeTo: button.bounds, of: button, preferredEdge: .maxY)
    }

}

