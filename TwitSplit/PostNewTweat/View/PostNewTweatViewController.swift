//
//  PostNewTweatViewController.swift
//  TwitSplit
//
//  Created by Hyubyn on 12/7/18.
//  Copyright © 2018 Hyubyn. All rights reserved.
//

import UIKit

class PostNewTweatViewController: BaseViewController {
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var inputTextView: UITextView!
    
    var presenter: PostNewTweatPresenterProtocol?
    
    override func setupView() {
        super.setupView()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height / 2
        avatarImageView.backgroundColor = .random()
        
        inputTextView.text = Constants.placeHolderText
        inputTextView.textColor = UIColor.lightGray
        inputTextView.becomeFirstResponder()
        inputTextView.selectedTextRange = inputTextView.textRange(from: inputTextView.beginningOfDocument, to: inputTextView.beginningOfDocument)
    }
    
    override func setupNavigationBar() {
        let leftItemButton = UIBarButtonItem(title: Constants.cancelTitle, style: .plain, target: self, action: #selector(cancelButtonTapped))
        self.navigationItem.leftBarButtonItem = leftItemButton
        let rightItemButton = UIBarButtonItem(title: Constants.postTitle, style: .plain, target: self, action: #selector(postButtonTapped))
        self.navigationItem.rightBarButtonItem = rightItemButton
        
        self.title = "New Tweat"
    }
    
    @objc func cancelButtonTapped() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func postButtonTapped() {
        guard let presenter = presenter else {
            self.showAlert(title: Constants.errorTitle, message: Constants.unknowErrorMessage, okAction: nil)
            return
        }
        presenter.postNewTweat(content: inputTextView.text)
    }
}

// MARK - PostNewTweatViewProtocol
extension PostNewTweatViewController: PostNewTweatViewProtocol {
    func setupDisplay() {
        
    }
    
    func showPostNewTweatWithResult(isSuccess: Bool, and message: String) {
        showAlert(title: isSuccess ? Constants.postSuccessTitle : Constants.postFailedTitle, message: message) {
            if isSuccess {
                self.cancelButtonTapped()
            }
        }
    }
    
    
}

// MARK - UITextViewDelegate
extension PostNewTweatViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        // Combine the textView text and the replacement text to
        // create the updated text string
        let currentText:String = textView.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
        
        // If updated text view will be empty, add the placeholder
        // and set the cursor to the beginning of the text view
        if updatedText.isEmpty {
            
            textView.text = Constants.placeHolderText
            textView.textColor = UIColor.lightGray
            
            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
        }
            
            // Else if the text view's placeholder is showing and the
            // length of the replacement string is greater than 0, set
            // the text color to black then set its text to the
            // replacement string
        else if textView.textColor == UIColor.lightGray && !text.isEmpty {
            textView.textColor = UIColor.black
            textView.text = text
        }
            
            // For every other case, the text should change with the usual
            // behavior...
        else {
            return true
        }
        
        // ...otherwise return false since the updates have already
        // been made
        return false
    }
    
    // to prevent the user from changing the position of the cursor while the placeholder's visible
    func textViewDidChangeSelection(_ textView: UITextView) {
        if self.view.window != nil {
            if textView.textColor == UIColor.lightGray {
                textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            }
        }
    }
}

extension Constants {
    static let cancelTitle = "Cancel"
    static let postTitle = "Post"
    static let errorTitle = "Error"
    static let postSuccessTitle = "Post Successful"
    static let postFailedTitle = "Post Failed"
    static let unknowErrorMessage = "Can not perform action now"
    static let placeHolderText = "What's happening?"
}
