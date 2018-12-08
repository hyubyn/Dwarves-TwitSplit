//
//  PostNewTweatProtocol.swift
//  TwitSplit
//
//  Created by Hyubyn on 12/8/18.
//  Copyright © 2018 Hyubyn. All rights reserved.
//

import UIKit

protocol PostNewTweatViewProtocol {
    // Presenter -> View
    var presenter: PostNewTweatPresenterProtocol? { get set }
    func setupDisplay()
    func showPostNewTweatWithResult(isSuccess: Bool, and error: String)
}

protocol PostNewTweatPresenterProtocol {
    
    var interactor: PostNewTweatInputInteractorProtocol? { get set }
    var view: PostNewTweatViewProtocol? { get set }
    var router: PostNewTweatWireFrameProtocol? { get set }
    // View -> Presenter
    func postNewTweat(content: String)
}

protocol PostNewTweatOutputInteractorProtocol {
    // Interactor -> Presenter
    func postNewTweatFailed(with reason: String)
    func postNewTweatSuccessful()
}

protocol PostNewTweatInputInteractorProtocol {
    var presenter: PostNewTweatOutputInteractorProtocol? { get set }
    // Presenter -> Interactor
    func sendNewTweatToServer(content: [String])
}

protocol PostNewTweatWireFrameProtocol {
    // Presenter -> WireFrame
    static func presentPostNewTweatModally(from: UIViewController)
}
