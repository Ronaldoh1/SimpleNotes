//
//  HomeViewController.swift
//  SimpleNotes
//
//  Created by Ronald Hernandez on 2/1/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    private let cellID = "noteCellIdentifier"

    private var notes: [Note]? {
        let note = Note()
        note.title = "Hi"
        note.body = "Dude fsfsdflsakjf slfj lsajflsajflasfjasljfljaslfjlsajlfasjkflajlfjlasdlfjasljfljldjlsfjlskdfjlsajlfjsalkjfklaj"
        return [note]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        tableView.register(NoteCell.self, forCellReuseIdentifier: cellID)
        tableView.estimatedRowHeight = 70
        tableView.separatorInset = .zero

        loadData()

        setupNavigationBarItems()
    }

    //MARK: Helper Methods

    private func setupNavigationBarItems() {
        navigationItem.title = "Notes"

        let newNoteButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newNote))
        navigationItem.rightBarButtonItem = newNoteButton
    }

    @objc private func newNote() {
        let editNoteVC = EditNoteViewController()
        navigationController?.pushViewController(editNoteVC, animated: true)
    }

    private func loadData() {

        
    }

    //MARK: UITableViewDataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = notes?.count {
            return count
        }

        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! NoteCell

        if let note = notes?[indexPath.row] {
            cell.note = note
        }

        return cell
    }


}


