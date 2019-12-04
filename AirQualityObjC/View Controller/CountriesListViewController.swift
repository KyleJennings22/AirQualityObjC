//
//  CountriesListViewController.swift
//  AirQualityObjC
//
//  Created by Kyle Jennings on 12/4/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

import UIKit

class CountriesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var countries: [String]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.title = "Countries"
        
        DVMCityAirQualityController.fetchSupportedCountries { (countries) in
            self.countries = countries
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        cell.textLabel?.text = countries?[indexPath.row]
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStatesVC" {
            guard let destinationVC = segue.destination as? StatesListViewController, let indexPath = tableView.indexPathForSelectedRow else {return}
            
            destinationVC.country = countries?[indexPath.row]
        }
        
    }
    

}
