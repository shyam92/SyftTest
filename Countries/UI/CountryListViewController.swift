//
//  CountryListViewController.swift
//  Countries
//
//  Created by Syft on 03/03/2020.
//  Copyright © 2020 Syft. All rights reserved.
//

import UIKit
import CoreData


class CountryListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var countryTableView: UITableView!
    var countries: [Country]?
    var populationFormatter = NumberFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countryTableView.rowHeight = UITableView.automaticDimension
        countryTableView.estimatedRowHeight = 100
        countryTableView.dataSource = self
        countryTableView.accessibilityIdentifier = "CountryTable"
        
        populationFormatter.numberStyle = .decimal
        populationFormatter.locale = Locale(identifier: "en_GB")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        HUD.show(in: view.window!)
        Server.shared.countryList() {[weak self] (countries, error)  in
            guard let weakSelf = self else {
                return
            }
            HUD.dismiss(from: weakSelf.view.window!)
            guard error == nil, let countries = countries else {
                assertionFailure("There was an error: \(error!)")
                return
            }
            weakSelf.countries = countries.sorted(by: {$0.name < $1.name})
            weakSelf.countryTableView.reloadData()
        }
    }
    
    
    // MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryInfoCell") as! CountryTableViewCell
        
        if let country = countries?[indexPath.row] {
            // Setup in cell to contain the data setting to cell
            cell.setup(with: country, and: populationFormatter)
        }
        return cell
    }
    
}

