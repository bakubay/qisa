//
//  StoriesGetter.swift
//  qurie
//
//  Created by mac on 7/26/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON




class StoriesGetter {

    let myUrl = "https://safe-crag-70258.herokuapp.com/"
    var noError = true
    
    func getChosenStory(time: String, theme: String, completion: @escaping (JSON) -> ()){
        
        Alamofire.request(myUrl, method: .post, parameters: ["time": time, "theme": theme]).response { response in
            if let data = response.data {
                self.noError = true
                do {
                    let json = try JSON(data: data)
                    print(json["StoryHTML"])
                    completion(json)
                } catch {
                    self.noError = false
                    print(self.noError)
                    print("WTF                 WTF             WTF")
                    print(error.localizedDescription)
                    
                }
            }
        }
    }
}

