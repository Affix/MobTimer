//
//  FullScreenViewController.swift
//  MobTimer
//
//  Created by Keiran Smith on 10/03/2017.
//  Copyright © 2017 Keiran Smith. All rights reserved.
//

import Cocoa

class FullScreenViewController: NSViewController {
    
    @IBOutlet weak var message: NSTextField!
    
    @IBOutlet var FullView: NSView!
    
    let global = Global()
    
    override func viewDidAppear() {
        let presOptions: NSApplicationPresentationOptions = ([.fullScreen,.autoHideMenuBar])
        let optionsDictionary = [NSFullScreenModeApplicationPresentationOptions :
            NSNumber(value: presOptions.rawValue)]
        
        self.view.enterFullScreenMode(NSScreen.main()!, withOptions:optionsDictionary)
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.black.cgColor
        
        message.stringValue = "Hello \(global.nextMobber), time to fly!\nPress any key to continue"
    }
    
    override func keyDown(with event: NSEvent) {
        // Do stuff to dismiss view
        
        FullView.isHidden = true
        let presOptions: NSApplicationPresentationOptions = ([.fullScreen,.autoHideMenuBar])
        let optionsDictionary = [NSFullScreenModeApplicationPresentationOptions :
            NSNumber(value: presOptions.rawValue)]
        self.view.exitFullScreenMode(options: optionsDictionary)
        self.view.wantsLayer = false
        FullView.window?.close()
    }
    
    func performSegue(for segue: NSStoryboardSegue, withIdentifier identifier: String, sender: Any?) {
        print(identifier)
        segue.perform()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
