//
//  WeatherViewController.swift
//  Weather
//
//  Created by Ehtisham Badar on 22/04/2024.
//

import UIKit
import Combine
import DGCharts

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var chartView: PieChartView!
    @IBOutlet weak var lblLoad: UILabel!
    @IBOutlet weak var cityTF: UITextField!
    
    private let weatherService = WeatherService()
    var viewModel = WeatherViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func setupPieChart(with temperatures: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<temperatures.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: 1.0)
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChartDataSet.colors = temperatures.map { TemperatureColor.color(for: $0) }
        pieChartDataSet.valueFormatter = HourValueFormatter()
        chartView.data = pieChartData
        pieChartDataSet.sliceSpace = 2
        pieChartDataSet.valueTextColor = UIColor.black
        pieChartDataSet.valueFont = UIFont.systemFont(ofSize: 10)
        chartView.notifyDataSetChanged()
    }
    private func bindViewModel() {
        viewModel.$isLoading
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] isLoading in
                if isLoading {
                    self?.lblLoad.text = "Loading..."
                } else {
                    self?.lblLoad.text = "Load complete"
                    self?.fetchWeatherData()
                }
            })
            .store(in: &cancellables)
        
        viewModel.$weather
            .receive(on: RunLoop.main)
            .compactMap { $0?.current?.tempC }
            .map { "\($0)°C" }
            .assign(to: \.text, on: lblLoad)
            .store(in: &cancellables)
    }
    private func fetchWeatherData(city: String? = "Lahore") {
        weatherService.fetchWeather(forCity: city ?? "Lahore")
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Failed to fetch weather data: \(error)")
                }
            }, receiveValue: { [weak self] weatherResponse in
                self?.printWeatherData(weatherResponse)
            })
            .store(in: &cancellables)
    }
    @IBAction func getForecastButtonPressed(_ sender: Any) {
        if cityTF.text != "" {
            fetchWeatherData(city: cityTF.text ?? "")
        }
    }
    
    
    private func printWeatherData(_ weather: WeatherResponseModel) {
        print("Weather Data for \(weather.location?.name ?? ""):")
        print("Temperature: \(weather.current?.tempC ?? 0)°C")
        print("Condition: \(weather.current?.condition?.text ?? "")")
        for i in 0..<(weather.forecast?.forecastday?.first?.hour?.count ?? 0) {
            print("Forecast: \(i)=\(weather.forecast?.forecastday?.first?.hour?[i].tempC ?? 0)")
        }
        if let hours = weather.forecast?.forecastday?.first?.hour {
            let temperatures = hours.compactMap { $0.tempC }
            setupPieChart(with: temperatures)
        }
    }
}
struct PieChartSegment {
    var color: UIColor
    var value: CGFloat
    var title: String
}
class HourValueFormatter: ValueFormatter {
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        return String(format: "%02d:00", Int(entry.x))
    }
}
