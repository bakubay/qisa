//
//  StringExtention.swift
//  qurie
//
//  Created by mac on 7/31/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation

extension String{
    func convertHtml() -> NSAttributedString{
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do{
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }catch{
            return NSAttributedString()
        }
    }
}
