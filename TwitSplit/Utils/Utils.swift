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
    
    class func getDifferenceTimeDisplaying(timeStampString: String) -> String {
        var result = ""
        let date = Date(timeIntervalSince1970: Double(timeStampString) ?? 0)
        let currentData = Date()
        let differenceSecond = currentData.timeIntervalSince(date)
        switch differenceSecond {
        case 0..<60:
            result = "Just now"
        case 60..<3600:
            let min = Int((differenceSecond / 60).rounded(.up))
            if min == 1 {
                result = "1 minute ago"
            } else {
                result = "\(min) minutes ago"
            }
        case 3600..<86400:
            let hour = Int((differenceSecond / 3600).rounded(.up))
            if hour == 1 {
                result = "1 hour ago"
            } else {
                result = "\(hour) hours ago"
            }
        case 86400..<604800:
            let day = Int((differenceSecond / 86400).rounded(.up))
            if day == 1 {
                result = "1 day ago"
            } else {
                result = "\(day) days ago"
            }
        case 604800..<2592000:
            let week = Int((differenceSecond / 604800).rounded(.up))
            if week == 1 {
                result = "1 week ago"
            } else {
                result = "\(week) weeks ago"
            }
        default:
            result = convertFromTimeStampToTimeString(timeStampString: timeStampString)
        }
        return result
    }
    
    class func splitMessage(content: String) -> (Bool, [String]) {
        if content.count <= Constants.maxCharacterCount {
            return (true, [content])
        } else {
            let total = content.split(separator: " ", maxSplits: Constants.maxCharacterCount, omittingEmptySubsequences: false).count // maximum total substring is array of string after has been splitted white space
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
                        if endIndex < startIndex { // couldn't find the spacing in this range
                            return (false, result)
                        }
                        if content[endIndex] == " " {
                            break
                        }
                    }
                }
                let subString = String(content[startIndex..<endIndex])
                result.append(subString)
                startIndex = endIndex + 1 // by pass spacing index
            }
            for finalIndex in 0 ..< result.count {
                result[finalIndex] = "\(finalIndex + 1)/\(result.count) \(result[finalIndex])"
            }
            return (true, result)
        }
    }
}
