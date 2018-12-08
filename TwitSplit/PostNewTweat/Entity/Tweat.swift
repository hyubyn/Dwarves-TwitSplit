//
//  Tweat.swift
//  TwitSplit
//
//  Created by Hyubyn on 12/8/18.
//  Copyright © 2018 Hyubyn. All rights reserved.
//

import UIKit

class Tweat: NSObject {
    var id = ""
    var content = [String]()
    init(withContent: [String]) {
        super.init()
        id = Utils.getCurrentTimeStampString()
        content = withContent
    }
    
    init(dict: [String: AnyObject]?) {
        super.init()
        guard let dict = dict else {
            return
        }
        let sortedDict = dict.sorted{ Int($0.key)! < Int($1.key)! }
        for (_, value) in sortedDict {
            guard let contentString = value as? String else {
                return
            }
            // remove "part indicator"
            if let separateIndex = contentString.firstIndex(of: " ") {
                let finalString = String(contentString.suffix(from: contentString.index(after: separateIndex)))
                content.append(finalString)
            } else {
                content.append(contentString)
            }
        }
        
    }
    
    func localizedString() -> String {
        var result = ""
        for index in 0 ..< content.count {
            result += " " + content[index]
        }
        return result
    }
}
