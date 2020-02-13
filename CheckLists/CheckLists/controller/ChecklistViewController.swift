//
//  ViewController.swift
//  CheckLists
//
//  Created by lpiem on 23/1/2563 BE.
//  Copyright © 2563 lpiem. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var items = [CheckListItem]()

    @IBOutlet weak var addNewCheckItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        items = []
        items.append(CheckListItem(text: "Fais la vaisselle", true))
        items.append(CheckListItem(text: "Fais la vaisselle", true))
        items.append(CheckListItem(text: "Fais la vaisselle", true))
        items.append(CheckListItem(text: "Fais la vaisselle", true))
        items.append(CheckListItem(text: "Fais la vaisselle", true))
        items.append(CheckListItem(text: "Fais la vaisselle", true))
        items.append(CheckListItem(text: "Fais la vaisselle", true))
        items.append(CheckListItem(text: "Fais la vaisselle", true))
        items.append(CheckListItem(text: "Fais la vaisselle", true))

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)
        configureCheckmark(for: cell, withItem: items[indexPath.row])
        configureText(for: cell, withItem: items[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        items[indexPath.item].toggleChecked()
        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.fade)
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        super.numberOfSections(in: tableView)
    }

    func configureCheckmark(for cell: UITableViewCell, withItem item: CheckListItem) {
        cell.accessoryType = item.checked ? .checkmark : .none
    }

    func configureText(for cell: UITableViewCell, withItem item: CheckListItem) {
        cell.textLabel?.text = item.text
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)

    }

    @IBAction func addCheckAction(_ sender: Any) {
        items.append(CheckListItem(text: "Nouvelle Note", false))
        self.tableView.reloadData()
    }
}

