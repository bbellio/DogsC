//
//  BBBreedListTableViewController.swift
//  Dogs-C
//
//  Created by Bethany Wride on 10/10/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

import UIKit

class BBBreedListTableViewController: UITableViewController {
    // Local source of truth
    var breeds: [BBBreed] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        BBBreedController.sharedInstance().fetchBreeds { (breeds) in
            DispatchQueue.main.async{
                self.breeds = breeds
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breeds.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let breed = breeds[indexPath.row]
        if breed.subbreeds.count == 0 {
            self.performSegue(withIdentifier: "toCollectionVC", sender: self)
        } else {
            self.performSegue(withIdentifier: "toSubbreedVC", sender: self)
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "breedCell", for: indexPath)
        let breed = breeds[indexPath.row]
        cell.textLabel?.text = breed.name
        return cell
    }
   
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSubbreedVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            guard let destinationVC = segue.destination as? BBSubbreedListTableViewController else { return }
            let breedToSend = breeds[indexPath.row]
            destinationVC.breed = breedToSend
        } else if segue.identifier == "toCollectionVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            guard let destinationVC = segue.destination as? BBBreedImagesCollectionViewController else { return }
            let breedToSend = breeds[indexPath.row]
            destinationVC.breed = breedToSend
        }
    }
} // End of class

