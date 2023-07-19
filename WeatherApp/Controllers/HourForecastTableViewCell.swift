//
//  HourForecastTableViewCell.swift
//  WeatherApp
//
//  Created by Ben Lapidge on 17/07/2023.
//

import UIKit

class HourForecastTableViewCell: UITableViewCell {
// MARK: - IBOutlets
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var conditionString: UILabel!
    @IBOutlet weak var conditonIcon: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
}
