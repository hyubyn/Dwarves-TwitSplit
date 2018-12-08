//
//  HomeInteractor.swift
//  TwitSplit
//
//  Created by Hyubyn on 12/8/18.
//  Copyright © 2018 Hyubyn. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HomeInteractor: HomeInputInteractorProtocol {
    var presenter: HomeOutputInteractorProtocol?
    
    let ref = Database.database().reference()
    
    func fetListMessageFromServer() {
        ref.child(Constants.databaseKey).observe(.value, with: { (snapShot) in
            //if the reference have some values
            if snapShot.childrenCount > 0 {
                var listMessage = [Tweat]()
                //iterating through all the values
                for tweat in snapShot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let tweatObject = tweat.value as? [String: AnyObject]
                    let model = Tweat(dict: tweatObject)
                    model.id = tweat.key
                    listMessage.append(model)
                }
                self.presenter?.fetchListMessageSuccessful(message: listMessage)
            }
        }) { (error) in
            self.presenter?.fetchListMessageFailed(with: error.localizedDescription)
        }
    }
    
    
}
