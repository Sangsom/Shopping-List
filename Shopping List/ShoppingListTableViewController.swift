//
//  ShoppingListTableViewController.swift
//  Shopping List
//
//  Created by Rinalds Domanovs on 14/06/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController {

    @IBOutlet var navigation: UINavigationItem!
    var shoppingList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigation.title = "Shopping List"
        navigation.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addItem))
    }

    // MARK: Table view methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }

    // MARK: Add item methods

    @objc func addItem() {
        let ac = UIAlertController(
            title: "Add item",
            message: nil,
            preferredStyle: .alert)
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            self.submit(answer.text!)

        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }

    func submit(_ answer: String) {
        shoppingList.append(answer)

        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}
