//
//  BBSubbreedListTableViewController.swift
//  Dogs-C
//
//  Created by Bethany Wride on 10/10/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

import UIKit

class BBSubbreedListTableViewController: UITableViewController {

    // Receiver
    var breed: BBBreed?
    
    // Locla source of truth
    var subbreeds: [BBSubbreed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            guard let receivedBreed = self.breed else { return }
            self.subbreeds = receivedBreed.subbreeds
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subbreeds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subbreedCell", for: indexPath)
        let subbreed = subbreeds[indexPath.row]
        cell.textLabel?.text = subbreed.name
        return cell
    }
  
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCollectionVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            guard let destinationVC = segue.destination as? BBBreedImagesCollectionViewController else { return }
           // Pass the subbreed's breed along with the subbreed
            guard let breed = breed else { return }
            let subbreedToSend = subbreeds[indexPath.row]
            destinationVC.subbreed = subbreedToSend
            destinationVC.breed = breed
        }
    }
}
