//
//  Utils.swift
//  TwitSplit
//
//  Created by Hyubyn on 12/8/18.
//  Copyright © 2018 Hyubyn. All rights reserved.
//

import UIKit

class Utils: NSObject {
    class func getCurrentTimeStampString() -> String {
        return String(Int(Date().timeIntervalSince1970))
    }
    
    class func getCurrentTimeStampIntValue() -> Int {
        return Int(Date().timeIntervalSince1970)
    }
    
    class func splitMessage(content: String) -> [String] {
        if content.count <= Constants.maxCharacterCount {
            return [content]
        } else {
            let total = Double(content.count) / Double(Constants.maxCharacterCount)
            let intTotal = Int(total.rounded(.up))
            var result = [String]()
            for index in 0 ..< intTotal {
                let startIndex = index * Constants.maxCharacterCount
                var endIndex = index * Constants.maxCharacterCount + Constants.maxCharacterCount
                if endIndex > content.count {
                    endIndex = content.count
                } else if endIndex == 0 {
                    endIndex = Constants.maxCharacterCount + 1
                }
                let subString = String(content[startIndex..<endIndex])
                let finalString = "\(index + 1)/\(intTotal) \(subString)"
                result.append(finalString)
            }
            return result
        }
    }
}
