//
//  ViewController.swift
//  MobTimer
//
//  Created by Keiran Smith on 09/03/2017.
//  Copyright © 2017 Keiran Smith. All rights reserved.
//

import Cocoa
import AVFoundation

class ViewController: NSViewController,NSTableViewDataSource,NSTableViewDelegate {
    
    
    var timer = Timer()
    var mobberArray: NSMutableArray = []
    var counter = 0
    var player: AVAudioPlayer?
    
    var state = 0
    
    @IBOutlet weak var mobName: NSTextField!
    
    @IBOutlet weak var mobberTable: NSTableView!
    
    @IBOutlet weak var timeInterval: NSTextField!
    
    @IBOutlet weak var startButton: NSButton!
    
    @IBOutlet weak var statusLabel: NSTextField!
    
    
    @IBAction func startButton(_ sender: Any) {
        // Lets start the timer
        if mobberArray.count > 0
        {
            if state == 0 {
                timer.invalidate()
                startTimer()
                startButton.title = "Stop"
                state = 1
            } else {
                timer.invalidate()
                state = 0
                counter = 0
                startButton.title = "Start"
            }
            statusLabel.stringValue = "Current Mobber: \(self.mobberArray.object(at: counter))"
        } else {
            statusLabel.stringValue = "Please add Mobbers"
        }
    }
    

    @IBAction func addMobber(_ sender: Any) {
        mobberArray.add(mobName.stringValue)
        mobName.stringValue = ""
        mobberTable.reloadData()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: (TimeInterval(timeInterval.intValue * 60)), target: self, selector: #selector(updateMob), userInfo: nil, repeats: true)
    }
    
    
    func updateMob()
    {
        timer.invalidate()
        let url = Bundle.main.url(forResource: "foghorn", withExtension: "wav")!
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
        startButton.title = "Switch"
        state = 0
        counter = counter + 1
        if counter >= mobberArray.count {
            counter = 0
        }

        statusLabel.stringValue = "Next Mobber: \(self.mobberArray.object(at: counter))"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mobberTable.delegate = self
        mobberTable.dataSource = self
    }
    
    /*
    override func viewDidAppear() {
        let presOptions: NSApplicationPresentationOptions = ([.fullScreen,.autoHideMenuBar])
        let optionsDictionary = [NSFullScreenModeApplicationPresentationOptions :
            NSNumber(value: presOptions.rawValue)]
        
        self.view.enterFullScreenMode(NSScreen.main()!, withOptions:optionsDictionary)
        self.view.wantsLayer = true
    }*/

    
   // DELEGATE METHODS

    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.mobberArray.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellView = mobberTable.make(withIdentifier: "cell", owner: self) as! NSTableCellView
        cellView.textField!.stringValue = self.mobberArray.object(at: row) as! String
        
        return cellView
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let selectedItem = self.mobberArray.object(at: self.mobberTable.selectedRow) as! String
        
        print(selectedItem)
        
        self.mobberTable.deselectRow(self.mobberTable.selectedRow)
    }
    
}

