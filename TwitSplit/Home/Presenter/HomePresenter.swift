//
//  HomePresenter.swift
//  TwitSplit
//
//  Created by Hyubyn on 12/8/18.
//  Copyright © 2018 Hyubyn. All rights reserved.
//

import UIKit

class HomePresenter: HomePresenterProtocol, HomeOutputInteractorProtocol {
    var interactor: HomeInputInteractorProtocol?
    
    var view: HomeViewProtocol?
    
    var router: HomeWireFrameProtocol?
    
    func fetchListMessage() {
        guard let interactor = interactor else {
            fetchListMessageFailed(with: "Interactor is nil")
            return
        }
        interactor.fetListMessageFromServer()
    }
    
    func fetchListMessageFailed(with reason: String) {
        view?.showErrorFromGetMessage(error: reason)
    }
    
    func fetchListMessageSuccessful(message: [Tweat]) {
        view?.showListMessage(message: message)
    }
    

}
