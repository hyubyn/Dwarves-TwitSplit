//
//  PostNewTweatPresenter.swift
//  TwitSplit
//
//  Created by Hyubyn on 12/8/18.
//  Copyright © 2018 Hyubyn. All rights reserved.
//

import UIKit

class PostNewTweatPresenter: PostNewTweatPresenterProtocol, PostNewTweatOutputInteractorProtocol {
    
    var interactor: PostNewTweatInputInteractorProtocol?
    
    var view: PostNewTweatViewProtocol?
    
    var router: PostNewTweatWireFrameProtocol?
    
    func postNewTweat(content: String) {
        guard let interactor = interactor else {
            self.postNewTweatFailed(with: "Interactor is nil")
            return
        }
        let result = checkContent(content: content)
        if result.0 {
            interactor.sendNewTweatToServer(content: result.1)
        } else {
            self.postNewTweatFailed(with: "Input is in wrong format")
        }
        
    }
    
    func postNewTweatFailed(with reason: String) {
        view?.showPostNewTweatWithResult(isSuccess: false, and: reason)
    }
    
    func postNewTweatSuccessful() {
        view?.showPostNewTweatWithResult(isSuccess: true, and: "Congratulations, you new tweat has been posted successfully!")
    }
    
    func checkContent(content: String) -> (Bool, [String]) {
        if content.count == 0 {
            return (false, [])
        }
        let arrayContent = Utils.splitMessage(content: content)
        return (true, arrayContent)
    }
    
}
