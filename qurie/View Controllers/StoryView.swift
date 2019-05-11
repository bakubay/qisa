//
//  StoryDisplayer.swift
//  qurie
//
//  Created by mac on 7/30/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import Lottie

class StoryDisplayer: UIViewController{
    
    var handler = StoriesGetter()
    var recievedTimeAndTheme: (time:String?,theme:String?)
    
    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var titleOfStory: UILabel!
    @IBOutlet weak var authorOfStory: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    @IBOutlet weak var StoryViewBackground: UIView!
    
    @IBOutlet weak var noInternetImage: UIImageView!
    @IBAction func dismissAllViews(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        print("Clicked")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let loadingAnimation = LOTAnimationView.init(name: "data")
        loadingAnimation.frame = CGRect(x: 0, y: self.view.center.y, width: self.view.frame.size.width, height: 100)
        loadingAnimation.contentMode = .scaleAspectFit
        
        self.view.addSubview(loadingAnimation )
        
        loadingAnimation.play()
        loadingAnimation.loopAnimation = true

        if Connectivity.isConnectedToInternet() != true{
            moreButton.setTitle("TRY AGAIN", for: .normal)
            moreButton.alpha = 1
            self.noInternetImage.alpha = 1
            


            loadingAnimation.removeFromSuperview()
        }
        
        
        handler.getChosenStory(time: recievedTimeAndTheme.time!, theme: recievedTimeAndTheme.theme!,completion: { response in
            if self.handler.noError == false{
                print("WTWTTTTTF")
                self.moreButton.setTitle("TRY AGAIN", for: .normal)
                self.moreButton.alpha = 1
                
                loadingAnimation.removeFromSuperview()
                
            }
            if let title = response["Title"].string{
                self.titleOfStory.text = title
            }
            if let author = response["Author"].string{
                self.authorOfStory.text = author
            }
            
            if let story = response["StoryHTML"].string {
                let storyText = story.convertHtml().string
                print(storyText)
                self.storyTextView.text = storyText
            } else {}
            
            loadingAnimation.removeFromSuperview()
            self.noInternetImage.alpha = 0
            self.moreButton.alpha = 1
            self.moreButton.setTitle("READ MORE", for: .normal)
            self.titleOfStory.alpha = 1
            self.authorOfStory.alpha = 1
            self.storyTextView.alpha = 1
        })
        

    }
}
