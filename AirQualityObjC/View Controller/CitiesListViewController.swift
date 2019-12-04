//
//  CitiesListViewController.swift
//  AirQualityObjC
//
//  Created by Kyle Jennings on 12/4/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

import UIKit

class CitiesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        guard let country = country, let state = state else {return}
        DVMCityAirQualityController.fetchSupportedCities(inState: country, state: state) { (cities) in
            self.cities = cities
        }
    }
    
    var country: String?
    var state: String?
    var cities: [String]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.title = self.state
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        cell.textLabel?.text = cities?[indexPath.row]
        return cell
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCityDetailVC" {
            guard let destinationVC = segue.destination as? CityDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {return}
            destinationVC.country = country
            destinationVC.state = state
            destinationVC.city = cities?[indexPath.row]
        }
    }
    

}
