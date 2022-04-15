//
//  BoredMemesViewController.swift
//  BoredDogs
//
//  Created by Владимир Киселев on 08.04.2022.
//

import UIKit

class BoredMemesViewController: UITableViewController {
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    
    var breweries: [Brewery] = []
//    var breweriesV2: [BreweryV2] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadingIndicator.startAnimating()
//        loadingIndicator.hidesWhenStopped = true
//        
        tableView.rowHeight = 100
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        breweries.isEmpty ? breweriesV2.count : breweries.count
        breweries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BreweryCell
        
        if breweries.isEmpty {
//            let breweryV2 = breweriesV2[indexPath.row]
//            cell.configure(with: breweryV2)
        } else {
            let brewery = breweries[indexPath.row]
            cell.configure(with: brewery)
        }
        
        return cell
    }
    
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
