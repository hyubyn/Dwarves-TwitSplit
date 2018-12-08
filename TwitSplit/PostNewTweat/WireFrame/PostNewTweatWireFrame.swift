//
//  PostNewTweatWireFrame.swift
//  TwitSplit
//
//  Created by Hyubyn on 12/8/18.
//  Copyright © 2018 Hyubyn. All rights reserved.
//

import UIKit

class PostNewTweatWireFrame: PostNewTweatWireFrameProtocol {
    static func presentPostNewTweatModally(from: UIViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: Constants.postNewTweatId) as! PostNewTweatViewController
        let presenter = PostNewTweatPresenter()
        let interactor = PostNewTweatInteractor()
        let wireFrame = PostNewTweatWireFrame()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = wireFrame
        interactor.presenter = presenter
        let nav = UINavigationController(rootViewController: view)
        from.present(nav, animated: true, completion: nil)
    }
}
