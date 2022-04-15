//
//  BoredMemesViewController.swift
//  BoredDogs
//
//  Created by Владимир Киселев on 08.04.2022.
//

import UIKit

class BreweriesViewController: UITableViewController {
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    
    var breweries: [Brewery] = []

    override func viewDidLoad() {
        super.viewDidLoad()
   
        tableView.rowHeight = 100
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        breweries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BreweryCell
        let brewery = breweries[indexPath.row]
        cell.configure(with: brewery)

        return cell
    }
    
    // MARK: - Network
    func alamofireGetBrewery() {
        NetworkManager.shared.fetchBreweryWithAlamofire(Link.breweryApi.rawValue) { result in
            switch result {
            case .success(let breweries):
                self.breweries = breweries
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
