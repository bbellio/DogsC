//
//  BBSubbreedListTableViewController.swift
//  Dogs-C
//
//  Created by Bethany Wride on 10/10/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

import UIKit

class BBSubbreedListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BBBreedController.sharedInstance().subbreeds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let subbreed = BBBreedController.sharedInstance().subbreeds[indexPath.row]
        cell.textLabel?.text = subbreed.name
        return cell
    }
  
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
