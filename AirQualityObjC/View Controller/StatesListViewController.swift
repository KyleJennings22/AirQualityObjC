//
//  StatesListViewController.swift
//  AirQualityObjC
//
//  Created by Kyle Jennings on 12/4/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

import UIKit

class StatesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        guard let country = country else {return}
        DVMCityAirQualityController.fetchSupportedStates(inCountry: country) { (states) in
            self.states = states
        }
    }
    
    var country: String?
    
    var states: [String]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.title = self.country
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        
        cell.textLabel?.text = states?[indexPath.row]
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCitiesVC" {
            guard let destinationVC = segue.destination as? CitiesListViewController, let indexPath = tableView.indexPathForSelectedRow else {return}
            destinationVC.country = country
            destinationVC.state = states?[indexPath.row]
        }
    }
    

}
