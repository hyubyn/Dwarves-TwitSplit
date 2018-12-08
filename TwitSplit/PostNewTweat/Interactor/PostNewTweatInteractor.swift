//
//  PostNewTweatInteracter.swift
//  TwitSplit
//
//  Created by Hyubyn on 12/8/18.
//  Copyright © 2018 Hyubyn. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PostNewTweatInteractor: PostNewTweatInputInteractorProtocol {
    
    var presenter: PostNewTweatOutputInteractorProtocol?
    
    var ref = Database.database().reference()
    
    func sendNewTweatToServer(content: [String]) {
        let model = Tweat(withContent: content)
        for index in 0 ..< content.count {
            ref.child("\(Constants.databaseKey)/\(model.id)/\(Utils.getCurrentTimeStampIntValue() + index)").setValue(model.content[index])
            // assume all content are uploaded successful, only check for last content
            if index == content.count - 1 {
                ref.child("\(Constants.databaseKey)/\(model.id)").observeSingleEvent(of: .childAdded, with: { (snapshot) in
                    self.presenter?.postNewTweatSuccessful()
                }) { (error) in
                    self.presenter?.postNewTweatFailed(with: error.localizedDescription)
                }
            }
        }
    }
    

}
