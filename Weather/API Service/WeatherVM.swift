//
//  WeatherVM.swift
//  Weather
//
//  Created by Ehtisham Badar on 22/04/2024.
//

import Combine

class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherResponseModel?
    @Published var isLoading = false
    private var cancellables = Set<AnyCancellable>()
    private let weatherService = WeatherService()

    func loadWeather() {
        isLoading = true
        weatherService.fetchWeather(forCity: "Lahore")
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure = completion {
                    self?.weather = nil
                }
                self?.isLoading = false
            }, receiveValue: { [weak self] weatherResponse in
                self?.weather = weatherResponse
            })
            .store(in: &cancellables)
    }
}
