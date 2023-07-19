//
//  DayDetailViewController.swift
//  WeatherApp
//
//  Created by Ben Lapidge on 16/07/2023.
//

import UIKit

class DayDetailViewController: UIViewController {
    // MARK: - Variables
    var day: WeatherModel?
    
    // MARK: - IBOutlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var conditionIcon: UIImageView!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var hourlyTableView: UITableView!
    @IBOutlet weak var gradientView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hourlyTableView.dataSource = self
        hourlyTableView.delegate = self
        dateLabel.text = day?.formattedDate.formatted(date: .abbreviated, time: .omitted) ?? ""
        conditionLabel.text = day?.conditionString ?? ""
        conditionIcon.image = UIImage(systemName: day?.conditionIcon ?? "cloud")
        maxTempLabel.text = "\(day?.maxtemp_cRounded ?? "00")°C"
        minTempLabel.text = "\(day?.mintemp_cRounded ?? "00")°C"
        gradientView.bounds = view.bounds
        updateUI(with: Utilities.shared.getColorArrayFromCondition(with: day?.conditionCode ?? 1135))
        
        // Do any additional setup after loading the view.
        //
    }
    
    func updateUI(with colors: [CGColor]) {
        let gradient = CAGradientLayer()
        gradient.colors = colors
        gradient.frame = gradientView.bounds
        gradientView.layer.addSublayer(gradient)
        
        
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = gradientView.bounds
        gradientView.addSubview(blurredEffectView)
    }
    
}


// MARK: - UITableView Datasource & Delegate Functions
extension DayDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return day?.hours.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = day?.formattedHours[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "hourCell", for: indexPath) as! HourForecastTableViewCell
        cell.conditionString.text = item?.conditionString
        cell.tempLabel.text = "\(item?.tempc.formatted() ?? "00")°C"
        cell.timeLabel.text = item?.formattedTime.formatted(date: .omitted, time: .shortened)
        cell.conditonIcon.image = UIImage(systemName: item?.conditionIcon ?? "cloud")
        
        
        return cell
    }

    
    
}
