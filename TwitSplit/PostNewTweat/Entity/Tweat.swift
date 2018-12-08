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
}
