//
//  ActivitiesTableViewController.swift
//  BoredDogs
//
//  Created by Владимир Киселев on 08.04.2022.
//

import UIKit

class ActivitiesTableViewController: UITableViewController {
    private var activities: [Activity] = []
    private var dog: Dog!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        activities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ActivityCell
        let activity = activities[indexPath.row]
//        guard let dog = dog ?? nil else { return }
//        cell.configure(with: activity, and: dog)
        return cell
    }
}

// MARK: - Networking
extension ActivitiesTableViewController {
    func fetchActitvities() {
        guard let url = URL(string: Link.boredApi.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                self.activities = try JSONDecoder().decode([Activity].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
