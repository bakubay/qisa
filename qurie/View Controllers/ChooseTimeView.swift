//
//  ViewController.swift
//  qurie
//
//  Created by mac on 7/26/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class ChooseTimeView: UIViewController {
    var timeAndTheme: (time: String?, theme: String?)
    
    var handler = StoriesGetter()
    
    @IBOutlet var TimeButtons: [UIButton]!
    
    override func viewDidLoad() {
        for button in TimeButtons{
            button.applyDesign()
        }
        super.viewDidLoad()
        
    }
    
    @IBAction func MinuteButtonClicked(_ sender: UIButton) {
        switch sender.tag{
        case 1:
            timeAndTheme.time = "1-min"
        case 2:
            timeAndTheme.time = "3-min"
        case 3:
            timeAndTheme.time = "5-min"
        default:
            timeAndTheme.time = ""
        }
        performSegue(withIdentifier: "TimeIsChosen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TimeIsChosen"{
            let destinationVC = segue.destination as! CategoryButtonsCollection
            destinationVC.recievedTimeAndTheme = timeAndTheme
        }
    }
    
}


extension UIButton{
    func applyDesign(){
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)

    }
}
