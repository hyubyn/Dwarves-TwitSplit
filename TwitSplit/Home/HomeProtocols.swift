//
//  HomeProtocols.swift
//  TwitSplit
//
//  Created by Hyubyn on 12/8/18.
//  Copyright © 2018 Hyubyn. All rights reserved.
//

import UIKit


protocol HomeViewProtocol {
    // Presenter -> View
    var presenter: HomePresenterProtocol? { get set }
    func setupDisplay()
    func showListMessage(message:[Tweat])
    func showErrorFromGetMessage(error: String)
}

protocol HomePresenterProtocol {
    
    var interactor: HomeInputInteractorProtocol? { get set }
    var view: HomeViewProtocol? { get set }
    var router: HomeWireFrameProtocol? { get set }
    // View -> Presenter
    func fetchListMessage()
}

protocol HomeOutputInteractorProtocol {
    // Interactor -> Presenter
    func fetchListMessageFailed(with reason: String)
    func fetchListMessageSuccessful(message:[Tweat])
}

protocol HomeInputInteractorProtocol {
    var presenter: HomeOutputInteractorProtocol? { get set }
    // Presenter -> Interactor
    func fetListMessageFromServer()
}

protocol HomeWireFrameProtocol {
    // Presenter -> WireFrame
    func presentPostNewTweatModally(from: UIViewController)

}
