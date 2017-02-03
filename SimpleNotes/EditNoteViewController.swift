//
//  EditNoteViewController.swift
//  SimpleNotes
//
//  Created by Ronald Hernandez on 2/2/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//

import UIKit

class EditNoteViewController: UIViewController {

    fileprivate let titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Title"
        return textField
    }()

    fileprivate lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Note..."
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textColor = .lightGray
        textView.delegate = self
        textView.inputAccessoryView = self.setUpKeyboardToolBar()
        return textView
    }()

    private let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    fileprivate let characterCountLabel: UILabel = {
        let label = UILabel()
        label.text = "140 Characters Remaining"
        label.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.rgb(red: 45, green: 190, blue: 96)
        return label
    }()

    fileprivate let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 5
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 40)
        button.backgroundColor = UIColor.rgb(red: 61, green: 167, blue: 244)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(saveNote), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setUpViews()
    }

    //MARK: Saving Data

    private func createNote(_ title: String, _ description: String) -> Note?{
        return nil
    }

    //MARK: Helper Methods

    private func setUpKeyboardToolBar() -> UIView {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
        toolBar.barStyle = UIBarStyle.default

        toolBar.items = [
            UIBarButtonItem(customView: characterCountLabel),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(customView: saveButton)
        ]
        toolBar.backgroundColor = UIColor.rgb(red: 132, green: 132, blue: 132)
        toolBar.sizeToFit()
        return toolBar
    }

    @objc private func saveNote() {

        if let title = titleTextField.text, !title.isEmpty, descriptionTextView.text != "Note...", descriptionTextView.text.characters.count != 0 {
            print("Hii")
        } else {
            presentAlert()
        }

    }

    private func presentAlert() {
        let alert = UIAlertController(title: "Uh-oh!", message: "You must entere a title and description for your note!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    private func setUpViews() {
        view.addSubview(titleTextField)
        titleTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        titleTextField.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 8).isActive = true
        titleTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 8).isActive  = true
        titleTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true

        view.addSubview(separatorLine)
        separatorLine.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        separatorLine.topAnchor.constraint(equalTo: titleTextField.bottomAnchor).isActive = true
        separatorLine.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true

        view.addSubview(descriptionTextView)
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 4).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: separatorLine.topAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: view.frame.height / 2).isActive = true
    }

}

extension EditNoteViewController: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        let characterCount = textView.text.characters.count
        characterCountLabel.text = "\(140 - characterCount) Characters remaining"
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        if text.characters.count == 0 {
            if textView.text.characters.count != 0 {
                return true
            }
        } else if textView.text.characters.count > 139 {
            return false
        }

        return true
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray  {
            textView.text = nil
            textView.textColor = .black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter text..."
            textView.textColor = .lightGray
        }
    }
}

