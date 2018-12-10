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
            self.postNewTweatFailed(with: Constants.interactionNilErrorMessage)
            return
        }
        let result = checkContent(content: content)
        if result.0 {
            interactor.sendNewTweatToServer(content: result.1)
        } else {
            self.postNewTweatFailed(with: Constants.inputInWrongFormatErrorMessage)
        }
        
    }
    
    func postNewTweatFailed(with reason: String) {
        view?.showPostNewTweatWithResult(isSuccess: false, and: reason)
    }
    
    func postNewTweatSuccessful() {
        view?.showPostNewTweatWithResult(isSuccess: true, and: Constants.postMessageSuccessMessage)
    }
    
    func checkContent(content: String) -> (Bool, [String]) {
        if content.count == 0 {
            return (false, [])
        }
        
        return Utils.splitMessage(content: content)
    }
    
}

extension Constants {
    static let interactionNilErrorMessage = "Interactor is nil"
    static let inputInWrongFormatErrorMessage = "Input is in wrong format"
    static let postMessageSuccessMessage = "Congratulations, you new tweat has been posted successfully!"
}
