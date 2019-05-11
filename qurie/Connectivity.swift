//
//  Connectivity.swift
//  qurie
//
//  Created by mac on 8/9/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import Alamofire
class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
