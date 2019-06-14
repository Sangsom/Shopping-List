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

        shoppingList.append("Goroh")
        shoppingList.append("Milk")

        navigation.title = "Shopping List"
        navigation.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addItem))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }

    @objc func addItem() {
        print("Adding item")
    }
}
