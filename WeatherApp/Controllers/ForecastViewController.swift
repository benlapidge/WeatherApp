//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ben Lapidge on 15/07/2023.
//

import UIKit

class ForecastViewController: UIViewController {
    
    // MARK: - Variables
    var forecast : [WeatherModel] = []
    var weatherManager = WeatherManager()
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var forecastTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var gradientView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.bringSubviewToFront(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        forecastTableView.dataSource = self
        forecastTableView.delegate = self
        loadWeather()
        
        // Do any additional setup after loading the view.
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
    
    func loadWeather(){
        
        Task {
            do {
                forecast = try await weatherManager.fetchForecast()
                //updateUI(with: UIColors.shared.getColorArrayFromCondition(with: forecast[0].conditionCode))
                
                activityIndicator.stopAnimating()
                forecastTableView.reloadData()
                
            } catch {
                let alert = UIAlertController(title: "Error", message: "Error \(error.localizedDescription)", preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                print(error)
            }
        }
    }
    
}

extension ForecastViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(forecast.count)
        return forecast.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "dayDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DayDetailViewController
        if let indexPath = forecastTableView.indexPathForSelectedRow {
            destinationVC.day = forecast[indexPath.row]
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath) as! ForecastTableViewCell
        let item = forecast[indexPath.row]
        print(item)
        cell.conditionIcon.image = UIImage(systemName: item.conditionIcon)
        cell.dateLabel.text = item.formattedDate.formatted(date: .abbreviated, time: .omitted)
        cell.conditionIcon.image = UIImage(systemName: Utilities.shared.formatConditionCode(with: item.conditionCode))
        cell.conditionLabel.text = item.conditionString
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        
        UIView.animate(withDuration: 0.5,delay: 0.05 * Double(indexPath.row),animations: {
            
                cell.alpha = 1
            
            })
    }
}
