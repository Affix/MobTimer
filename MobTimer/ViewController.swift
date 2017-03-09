//
//  ViewController.swift
//  MobTimer
//
//  Created by Keiran Smith on 09/03/2017.
//  Copyright © 2017 Keiran Smith. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    override func viewDidAppear() {
        let presOptions: NSApplicationPresentationOptions = ([.fullScreen,.autoHideMenuBar])
        let optionsDictionary = [NSFullScreenModeApplicationPresentationOptions :
            NSNumber(value: presOptions.rawValue)]
        
        self.view.enterFullScreenMode(NSScreen.main()!, withOptions:optionsDictionary)
        self.view.wantsLayer = true
    }*/

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

