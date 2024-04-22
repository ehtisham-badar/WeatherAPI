//
//  WeatherService.swift
//  Weather
//
//  Created by Ehtisham Badar on 22/04/2024.
//

import Combine
import Foundation

class WeatherService {
    private var cancellables = Set<AnyCancellable>()
    let apiKey = "f1795f7d0e62485592e151825242104"
    func fetchWeather(forCity city: String) -> AnyPublisher<WeatherResponseModel, Error> {
        let urlString = "http://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(city)&days=1&aqi=no&alerts=no"
        let url = URL(string: urlString)!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: WeatherResponseModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
