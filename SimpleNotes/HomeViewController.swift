
//
//  HomeViewController.swift
//  SimpleNotes
//
//  Created by Ronald Hernandez on 2/1/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UITableViewController {

    private let cellID = "noteCellIdentifier"

    private var notes = [Note]()

    //MARK: Life Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        tableView.register(NoteCell.self, forCellReuseIdentifier: cellID)
        tableView.estimatedRowHeight = 70
        tableView.separatorInset = .zero

        loadData()

        setupNavigationBarItems()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
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

      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
        }
      let context = appDelegate.persistentContainer.viewContext

       let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        request.sortDescriptors  = [NSSortDescriptor(key: "date", ascending: false)]

       request.returnsObjectsAsFaults = false

        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                notes.removeAll()
                for result in results {
                    guard let note = result as? Note else {
                        return
                    }
                    notes.append(note)

                }
            }
        } catch let error {
            print(error)
        }

       self.tableView.reloadData()
    }

    //MARK: UITableViewDataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! NoteCell

        let note = notes[indexPath.row]
        cell.note = note


        return cell
    }


}


