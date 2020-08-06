//
//  CountryTableViewCell.swift
//  Countries
//
//  Created by Syft on 05/03/2020.
//  Copyright © 2020 Syft. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var capitalStackView: UIStackView!
    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var areaStackView: UIStackView!
    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with countryData: Country, and populationFormatter: NumberFormatter) {
        country.text = countryData.name
        capital.text = countryData.capital
        population.text = populationFormatter.string(from: NSNumber(value: countryData.population))
        // United States Minor Outlying Islands does not have area number
        if countryData.area != 0 {
            area.text = String(countryData.area)
        }
        region.text = countryData.region
        
        setAccessabilityValues(countryData: countryData)
    }
    
    func setAccessabilityValues(countryData: Country) {
        accessibilityIdentifier = "\(countryData.name)-Cell"
        country.accessibilityIdentifier = "Country"
        if let capitalData = countryData.capital, capitalData.isEmpty == false {
            capital.accessibilityIdentifier = "\(countryData.name)-Capital"
            capitalLabel.accessibilityIdentifier = "\(countryData.name)-Capital-Label"
            capitalStackView.isHidden = false
        } else {
            capitalStackView.isHidden = true
        }
        population.accessibilityIdentifier = "\(countryData.name)-Population"
        populationLabel.accessibilityIdentifier = "\(countryData.name)-Population-Label"
        population.accessibilityIdentifier = "\(countryData.name)-Population"
        populationLabel.accessibilityIdentifier = "\(countryData.name)-Population-Label"
        if countryData.area == 0 {
            areaStackView.isHidden = true
        } else {
            area.accessibilityIdentifier = "\(countryData.name)-Area"
            areaLabel.accessibilityIdentifier = "\(countryData.name)-Area-Label"
            areaStackView.isHidden = false
        }
        region.accessibilityIdentifier = "\(countryData.name)-Region"
        regionLabel.accessibilityIdentifier = "\(countryData.name)-Region-Label"
    }

}
