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
    
    class func convertFromTimeStampToTimeString(timeStampString: String) -> String {
        let date = Date(timeIntervalSince1970: Double(timeStampString) ?? 0)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    
    class func splitMessage(content: String) -> (Bool, [String]) {
        if content.count <= Constants.maxCharacterCount {
            return (true, [content])
        } else {
            let total = content.split(separator: " ", maxSplits: Constants.maxCharacterCount, omittingEmptySubsequences: false).count // maximum total substring is array of string after has splitted white space
            var result = [String]()
            var startIndex = 0
            var endIndex = 0
            for index in 0 ..< total {
                if startIndex >= content.count {
                    break;
                }
                let prefix = "\(index + 1)/\(total) "
                let maxSubStringLenght = Constants.maxCharacterCount - prefix.count
                endIndex = startIndex + maxSubStringLenght
                if endIndex > content.count {
                    endIndex = content.count
                }
                // check condition for subString of white spacing
                if endIndex < content.count {
                    while content[endIndex] != " " {
                        endIndex -= 1
                        if endIndex < startIndex {
                            return (false, [])
                        }
                        if content[endIndex] == " " {
                            break
                        }
                    }
                }
                let subString = String(content[startIndex..<endIndex])
                result.append(subString)
                startIndex = endIndex + 1 // by pass spacing
            }
            for finalIndex in 0 ..< result.count {
                result[finalIndex] = "\(finalIndex + 1)/\(result.count) \(result[finalIndex])"
            }
            return (true, result)
        }
    }
}
